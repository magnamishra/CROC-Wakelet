// test_wakelet.c CVE2 firmware for Wakelet binary offload
//
// Sequence:
//   1. JTAG has already written Snitch binary into IMEM (0x2001_0000)
//   2. CVE2 wakes Snitch via CLINT_WAKEUP_TRIG
//   3. Snitch exits WFI, bootrom jumps to IMEM, executes binary
//   4. Snitch writes WAKELET_DONE (0x2004_0008) when finished
//   5. CVE2 sees MEIP, handles interrupt, done
//
// Build:
//   Same Makefile target as other tests in sw/test/
//   riscv32-unknown-elf-gcc -march=rv32imc -mabi=ilp32 ...

#include "util.h"
#include "config.h"
 
// -------------------------------------------------------------------
// Volatile flag set by interrupt handler
// -------------------------------------------------------------------
static volatile int wakelet_done = 0;
 
// -------------------------------------------------------------------
// Interrupt handler
// Overrides weak default in crt0.S
// Bootrom trap handler dispatches here via SRAM vector at 0x1000_0008
// cause = mcause value (bit 31 set for interrupts)
// -------------------------------------------------------------------
void croc_interrupt_handler(uint32_t cause) {
    if (cause == IRQ_EXTERNAL) {
        // WAKELET_DONE asserted ? Snitch has finished
        wakelet_done = 1;
    }
}
 
// -------------------------------------------------------------------
// Main
// -------------------------------------------------------------------
int main() {
 
    // Enable MEIP so WAKELET_DONE signal can reach CVE2
    // Behaviour on receiving WAKELET_DONE is TBD
    set_interrupt_enable(1, IRQ_EXTERNAL);
    set_global_irq_enable(1);
 
    // CVE2 goes about its day TBD what that means
    return 0;
}