// test_wakelet.c CVE2 firmware for Wakelet binary offload
//
// CVE2 owns the full offload sequence:
//   1. Copy Snitch binary from .rodata into Snitch IMEM
//   2. Write source data into Snitch DMEM
//   3. Wake Snitch via CLINT_WAKEUP_TRIG
//   4. CVE2 goes about its day (TBD)
//   5. Snitch executes binary, writes WAKELET_DONE
//   6. CVE2 sees MEIP from WAKELET_DONE (handler TBD)
 
#include "util.h"
#include "config.h"
 
// Auto-generated header containing Snitch binary as byte array
// Update path as per bender dependency 
#include "test_wakelet_bin.h"
 
// -------------------------------------------------------------------
// Interrupt handler TBD what CVE2 does on WAKELET_DONE
// -------------------------------------------------------------------
void croc_interrupt_handler(uint32_t cause) {
    if (cause == IRQ_EXTERNAL) {
        // WAKELET_DONE received TBD
    }
}
 
// -------------------------------------------------------------------
// Main
// -------------------------------------------------------------------
int main() {
 
    // Step 1 Enable MEIP so WAKELET_DONE can reach CVE2
    set_interrupt_enable(1, IRQ_EXTERNAL);
    set_global_irq_enable(1);
 
    // Step 2.1 Copy Snitch binary into Wakelet IMEM word by word
    volatile uint32_t *imem = (volatile uint32_t *) WAKELET_IMEM_ADDR;
    const uint32_t *src = (const uint32_t *) snitch_workload_bin;
    for (uint32_t i = 0; i < SNITCH_WORKLOAD_WORDS; i++) {
        imem[i] = src[i];
    }
    fence();

    //Step 2.2 Write HWPE parameters into Snitch PMEM
    //volatile uint32_t *pmem = (volatile uint32_t *) WAKELET_PMEM_ADDR;
    //pmem[0] = 0xdeadbeef;
    //pmem[1] = 0xabcdef01;
    //pmem[2] = 0x12121212;
    //pmem[3] = 0x34343434;
    //pmem[4] = 0x56565656;
    //pmem[5] = 0x78787878;
    //fence();

    // Step 3 Write source data into Snitch DMEM
    // Test data for the data mover workload
    volatile uint32_t *dmem = (volatile uint32_t *) WAKELET_DMEM_ADDR;
    dmem[0]  = 0xDEADBEEF;
    dmem[1]  = 0xCAFEBABE;
    dmem[2]  = 0x12345678;
    dmem[3]  = 0xABCDABCD;
    dmem[4]  = 0x11111111;
    dmem[5]  = 0x22222222;
    dmem[6]  = 0x33333333;
    dmem[7]  = 0x44444444;
    fence();
 
    // Step 4 Wake Snitch via CLINT WAKEUP_TRIG
    // 1-cycle pulse -> Snitch MEIP -> exits WFI -> bootrom jumps to IMEM
    *reg32(CLINT_BASE_ADDR, CLINT_WAKEUP_TRIG_OFFSET) = 0x1;
 
    // Step 5 CVE2 goes about its day (TBD)
    // For now just return -> WAKELET_DONE will fire MEIP when Snitch is done
    return 0;
}
 