// Copyright (c) 2026 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0/
//
// Adapted from test_clint.c and Wakelet/sw/test_datamem.c to test obi to axi_lite 
// Addressability test 

// Authors:
// - Philippe Sauter <phsauter@iis.ee.ethz.ch>
// - Magna Mishra    < Wakelet addressability test >

// 

#include <stdint.h> 
#include "uart.h"
#include "print.h"
#include "util.h"
#include "config.h"

int main() {

    volatile uint32_t x;
    volatile uint32_t *dmem = (volatile uint32_t *) WAKELET_DMEM_ADDR;
    volatile uint32_t *imem = (volatile uint32_t *) WAKELET_IMEM_ADDR;

    // Data memory test 
    // config.h should fetch WAKELET_DMEM_ADDRESS = croc_pkg::UserBaseAddr + wl_pkg::DataMemBaseAddr
    
    // Define data - borrowed from Wakelet/sw/test_data_mem.c 
    
    //uart_init(); 
    //printf("Starting data memory write tests \n") ; 

    dmem[0]  = 0xDEADBEEF;
    dmem[1]  = 0XAAAAAAAA; 
    dmem[2]  = 0xC0FFEEEE; 
    dmem[16] = 0xC0C0CAFE; 
    dmem[32] = 0x09062000; 

    //printf("Ending data memory write tests \n") ; 

    fence(); 
    
    //printf("Starting data memory read tests \n");

    x= dmem[0] ; if (x != 0xDEADBEEF) return 1;
    x= dmem[1] ; if (x != 0xAAAAAAAA) return 2;
    x= dmem[2] ; if (x != 0xC0FFEEEE) return 3;
    x= dmem[16]; if (x != 0XC0C0CAFE) return 4;
    x= dmem[32]; if (x != 0x09062000) return 5;

    //printf("Ending data memory read tests \n") ; 

    // Instruction memory test 
    // config.h should fetch WAKELET_IMEM_ADDRESS = croc_pkg::UserBaseAddr + wl_pkg::InstMemBaseAddr
    
    // Define data - borrowed from Wakelet/sw/test_data_mem.c 

    
    //printf("Starting instruction memory write tests \n");

    imem[0]  = 0xF0CACC1A;
    imem[1]  = 0x11111111; 
    imem[2]  = 0x22222222; 
    imem[16] = 0x66666666; 
    imem[32] = 0xFFFFFFFF; 

    fencei(); 

    x= imem[0] ; if (x != 0xF0CACC1A) return 6;
    x= imem[1] ; if (x != 0x11111111) return 7;
    x= imem[2] ; if (x != 0x22222222) return 8;
    x= imem[16]; if (x != 0x66666666) return 9;
    x= imem[32]; if (x != 0xFFFFFFFF) return 10;

    //printf("Ending instruction memory read tests \n") ;

    return 0;
}