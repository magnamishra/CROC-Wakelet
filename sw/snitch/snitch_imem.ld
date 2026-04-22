/* snitch_imem.ld — Linker script for Snitch workload
 *
 * Maps .text to IMEM and .data/.bss to DMEM
 * Snitch internal address space (BaseOffset stripped by OBI->AXI bridge)
 *
 * Global addresses (as seen from CROC/JTAG):
 *   IMEM: 0x2001_0000  (load .text here via JTAG SBA)
 *   DMEM: 0x2002_0000  (load .data here via JTAG SBA)
 *
 * Internal addresses (as seen by Snitch after bridge strips BaseOffset):
 *   IMEM: 0x0001_0000
 *   DMEM: 0x0002_0000
 */

OUTPUT_ARCH("riscv")
ENTRY(_start)

MEMORY
{
    imem (rx)  : ORIGIN = 0x00010000, LENGTH = 512
    dmem (rwx) : ORIGIN = 0x00020000, LENGTH = 512
}

SECTIONS
{
    .text 0x00010000 :
    {
        *(.text._start)
        *(.text)
        *(.text.*)
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);
    } > imem

    .data 0x00020000 :
    {
        *(.data)
        *(.data.*)
        *(.sdata)
        *(.sdata.*)
        . = ALIGN(4);
    } > dmem

    .bss (NOLOAD) :
    {
        *(.bss)
        *(.sbss)
        *(COMMON)
        . = ALIGN(4);
    } > dmem

    /DISCARD/ :
    {
        *(.riscv.attributes)
        *(.comment)
        *(.eh_frame)
    }
}

/* Stack grows downward from top of DMEM */
PROVIDE(__stack_top = ORIGIN(dmem) + LENGTH(dmem));
