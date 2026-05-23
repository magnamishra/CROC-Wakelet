// test_pixel_compare.c
// CVE2 firmware to offload Snitch pixel comparison binary
// Binary offload has already been tested in test_wakelet 
// Full test flow 
// 1. CVE2 wakes up, takes the compiled binary and loads it in Snitch 
// 2. Once binary loading is full, Snitch wakes from WFI and uses the binary to configure the datamover 
// 3. Snitch stays in WFI while datamover runs the pixel compare job 
// 4. Datamover detects a threshold (set in run time), sends MXIP (MCIP)
// 5. Snitch wakes from WFI and signals CVE2
// 6. CVE2 wakes from WFI 

#include "util.h"
#include "config.h"
#include "test_pixel_compare.h"

volatile int wakelet_fired = 0;

void croc_interrupt_handler(uint32_t cause) {
    if (cause == IRQ_EXTERNAL) {
        wakelet_fired = 1; 
    }
}

int main() {
    // Enable MEIP so WAKELET_DONE can reach CVE2
    set_interrupt_enable(1, IRQ_EXTERNAL);
    set_global_irq_enable(1);

    // Copy Snitch binary into Wakelet IMEM
    volatile uint32_t *imem = (volatile uint32_t *) WAKELET_IMEM_ADDR;
    const uint32_t *src = (const uint32_t *) snitch_workload_bin;
    for (uint32_t i = 0; i < SNITCH_WORKLOAD_WORDS; i++) {
        imem[i] = src[i];
    }
    fence();

    // Wake Snitch via CLINT WAKEUP_TRIG
    *reg32(CLINT_BASE_ADDR, CLINT_WAKEUP_TRIG_OFFSET) = 0x1;

    // CVE2 waits for WAKELET_DONE interrupt
    while(!wakelet_fired) asm volatile("wfi");

    return 0;
}