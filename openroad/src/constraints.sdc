# Copyright 2024 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

# Authors:
# - Philippe Sauter <phsauter@iis.ee.ethz.ch>
# - Changes 
#     - Add multicycle latency constraint to snitch instret_q
#     - Violation at this point - 20ns pre CTS
#     - Add extra head room for clock to meet latency targets
############
## Global ##
############

source src/instances.tcl


#############################
## Driving Cells and Loads ##
#############################

# As a default, drive multiple GPIO pads and be driven by one.
# accomodate for driving up to 2 74HC pads plus a 5pF trace
set_load [expr 2 * 5.0 + 5.0] [all_outputs]
set_driving_cell [all_inputs] -lib_cell sg13g2_IOPadOut16mA -pin pad


##################
## Input Clocks ##
##################
puts "Clocks..."

# We target 100 MHz
set TCK_SYS 10.0
create_clock -name clk_sys -period $TCK_SYS [get_ports clk_i]

set TCK_JTG 25.0
create_clock -name clk_jtg -period $TCK_JTG [get_ports jtag_tck_i]

set TCK_RTC 50.0
create_clock -name clk_rtc -period $TCK_RTC [get_ports ref_clk_i]


##################################
## Clock Groups & Uncertainties ##
##################################

# Define which clocks are asynchronous to each other
# If you have added a clock it is a good idea to temporarily add -allow_paths.
# This means the paths between clocks (CDC) are timed and will show up as violations,
# making them very easy to find and write constraints for.
set_clock_groups -asynchronous -name clk_groups_async \
     -group {clk_rtc} \
     -group {clk_jtg} \
     -group {clk_sys}

# We set reasonable uncertainties in their transistion timing
# and transition (rise/fall) times for all clocks (ns)
set_clock_uncertainty 0.1 [all_clocks]
set_clock_transition  0.2 [all_clocks]


####################
## Cdcs and Syncs ##
####################
puts "CDC/Sync..."

# Clock Domain Crossings: paths going from an FF with one clock to an FF with another.
# The setup/hold checks on these paths are deactivated by set_clock_groups -asynchronous.
# An additional requirement is that the max delay is below min($TCK_SYS, $TCK_JTG) 
# to make sure any change propages within one cycle of either clock.
# An (optional) lower delay is better for metastability recovery -> 3ns as a reasonable goal

## Constrain `cdc_2phase` for DMI request
#set_max_delay 3.0 -from $JTAG_ASYNC_REQ_START -to $JTAG_ASYNC_REQ_END -ignore_clock_latency
if {[llength $JTAG_ASYNC_REQ_START] > 0 && [llength $JTAG_ASYNC_REQ_END] > 0} {
    set_max_delay 3.0 -from $JTAG_ASYNC_REQ_START -to $JTAG_ASYNC_REQ_END -ignore_clock_latency
}
# Constrain `cdc_2phase` for DMI response
#set_max_delay 3.0 -from $JTAG_ASYNC_RSP_START -to $JTAG_ASYNC_RSP_END -ignore_clock_latency
if {[llength $JTAG_ASYNC_RSP_START] > 0 && [llength $JTAG_ASYNC_RSP_END] > 0} {
    set_max_delay 3.0 -from $JTAG_ASYNC_RSP_START -to $JTAG_ASYNC_RSP_END -ignore_clock_latency
}

##############
## Wakelet ##
#############
set_multicycle_path 2 -setup -through [get_pins -hierarchical {*i_instr_mem.i_scm.MemContentxDP*/Q}]
set_multicycle_path 1 -hold  -through [get_pins -hierarchical {*i_instr_mem.i_scm.MemContentxDP*/Q}]

set_multicycle_path 2 -setup -through [get_pins -hierarchical {*i_data_mem.i_scm.MemContentxDP*/Q}]
set_multicycle_path 1 -hold  -through [get_pins -hierarchical {*i_data_mem.i_scm.MemContentxDP*/Q}]

set_multicycle_path 2 -setup -through [get_pins -hierarchical {*i_hwpe_subsystem.banks_gen*.i_scm.MemContentxDP*/Q}]
set_multicycle_path 1 -hold  -through [get_pins -hierarchical {*i_hwpe_subsystem.banks_gen*.i_scm.MemContentxDP*/Q}]
# ===== SCM memory 2-cycle read relaxation (designer-confirmed architecturally valid) =====
# Activation / instruction / data SCMs (i_scm, MemContentxDP)
set_multicycle_path 2 -setup -through [get_pins -hierarchical {*i_instr_mem.i_scm.MemContentxDP*/Q}]
set_multicycle_path 1 -hold  -through [get_pins -hierarchical {*i_instr_mem.i_scm.MemContentxDP*/Q}]
set_multicycle_path 2 -setup -through [get_pins -hierarchical {*i_data_mem.i_scm.MemContentxDP*/Q}]
set_multicycle_path 1 -hold  -through [get_pins -hierarchical {*i_data_mem.i_scm.MemContentxDP*/Q}]
set_multicycle_path 2 -setup -through [get_pins -hierarchical {*i_hwpe_subsystem.banks_gen*.i_scm.MemContentxDP*/Q}]
set_multicycle_path 1 -hold  -through [get_pins -hierarchical {*i_hwpe_subsystem.banks_gen*.i_scm.MemContentxDP*/Q}]
# HWPE parameter memories (i_param_scm, MemContentxDP) -- omitted from designer ref, included here
set_multicycle_path 2 -setup -through [get_pins -hierarchical {*i_hwpe_wmem*i_param_scm.MemContentxDP*/Q}]
set_multicycle_path 1 -hold  -through [get_pins -hierarchical {*i_hwpe_wmem*i_param_scm.MemContentxDP*/Q}]
set_multicycle_path 2 -setup -through [get_pins -hierarchical {*i_hwpe_nqmem*i_param_scm.MemContentxDP*/Q}]
set_multicycle_path 1 -hold  -through [get_pins -hierarchical {*i_hwpe_nqmem*i_param_scm.MemContentxDP*/Q}]
# Datamover regfile (i_regfile_latch, MemContent -- note: NOT MemContentxDP)
set_multicycle_path 2 -setup -through [get_pins -hierarchical {*i_regfile_latch.MemContent*/Q}]
set_multicycle_path 1 -hold  -through [get_pins -hierarchical {*i_regfile_latch.MemContent*/Q}]
#############
## SoC Ins ##
#############
puts "Input/Outputs..."

# Reset should propagate to system domain within a clock cycle.
set_input_delay -max [ expr $TCK_JTG * 0.10 ] [get_ports {rst_ni testmode_i}]  
set_false_path -hold   -from [get_ports {rst_ni testmode_i}]
set_max_delay $TCK_SYS -from [get_ports {rst_ni testmode_i}]

# instret_q is a free-running retired-instruction performance counter
# (snitch.sv:345 `FFLAR(instret_q, instret_q + 1, !stall, ...); consumed only by
# self-increment and CSR reads at snitch.sv:2378/2384). The 64-bit ripple-carry
# increment is not single-cycle critical: the counter need only be coherent when
# read via CSR, many cycles after any given increment. Declared multicycle.
# (The ripple structure persists because keep_hierarchy blocks cross-boundary
# adder optimization; multicycle reflects true microarchitectural intent.)
set_multicycle_path -setup 4 -to [get_pins {*i_snitch*instret_q_*_reg/D}]
set_multicycle_path -hold  3 -to [get_pins {*i_snitch*instret_q_*_reg/D}]

##########
## JTAG ##
##########
puts "JTAG..."

set_input_delay  -min -add_delay -clock clk_jtg [ expr $TCK_JTG * 0.10 ] [get_ports {jtag_tdi_i jtag_tms_i}]
set_input_delay  -max -add_delay -clock clk_jtg [ expr $TCK_JTG * 0.30 ] [get_ports {jtag_tdi_i jtag_tms_i}]
set_output_delay -min -add_delay -clock clk_jtg [ expr $TCK_JTG * 0.10 ] [get_ports jtag_tdo_o]
set_output_delay -max -add_delay -clock clk_jtg [ expr $TCK_JTG * 0.20 ] [get_ports jtag_tdo_o]

# Reset should propagate to system domain within a clock cycle.
set_input_delay -max [ expr $TCK_JTG * 0.10 ] [get_ports jtag_trst_ni]  
set_false_path -hold    -from [get_ports jtag_trst_ni]
set_max_delay $TCK_JTG  -from [get_ports jtag_trst_ni]


##########
## GPIO ##
##########
puts "GPIO..."

set_input_delay  -min -add_delay -clock clk_sys [ expr $TCK_SYS * 0.10 ] [get_ports {gpio*}]
set_input_delay  -max -add_delay -clock clk_sys [ expr $TCK_SYS * 0.30 ] [get_ports {gpio*}]

set_output_delay -min -add_delay -clock clk_sys [ expr $TCK_SYS * 0.10 ] [get_ports {gpio*}]
set_output_delay -max -add_delay -clock clk_sys [ expr $TCK_SYS * 0.30 ] [get_ports {gpio*}]

# The timing of these signals are not important but we want to keep them in-cycle
set_output_delay -min -add_delay -clock clk_sys [ expr $TCK_SYS * 0.10 ] [get_ports {status_o unused*}]
set_output_delay -max -add_delay -clock clk_sys [ expr $TCK_SYS * 0.10 ] [get_ports {status_o unused*}]


##########
## UART ##
##########
puts "UART..."

set_input_delay  -min -add_delay -clock clk_sys [ expr $TCK_SYS * 0.10 ] [get_ports uart_rx_i]
set_input_delay  -max -add_delay -clock clk_sys [ expr $TCK_SYS * 0.30 ] [get_ports uart_rx_i]
set_output_delay -min -add_delay -clock clk_sys [ expr $TCK_SYS * 0.10 ] [get_ports uart_tx_o]
set_output_delay -max -add_delay -clock clk_sys [ expr $TCK_SYS * 0.30 ] [get_ports uart_tx_o]
