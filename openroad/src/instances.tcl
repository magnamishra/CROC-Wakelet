# Copyright 2024 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
# Authors:
# - Philippe Sauter <phsauter@iis.ee.ethz.ch>
# Changes (reverted)
# - No Wakelet SRAM blocks 
# - Macro naming and heirarchy paths change because --keep-heirarchy is now
#   - --best-keep-heirarchy
#   - Changes applied to JGTAG CDC and SRAM
# Automatic collection of SRAMs and delay-line macros
# Used for automatic macro placement
# set macros [list]
# set srams [get_cells *RM_IHP*]
# foreach inst $srams {
#     lappend macros $inst
# }
# Macro names as produced by the yosys synthesis
# Used for manual macro placement
set CROC            i_croc_soc.i_croc
set USER            i_croc_soc.i_user
set IBEX            $CROC.i_core_wrap.i_ibex
set SRAM            $CROC.gen_sram_bank
set JTAG            $CROC.i_dmi_jtag
set SRAM_512x32     gen_512x32xBx1.i_cut

# memory banks
set sram {\[0\].i_sram.}
set bank0_sram0 {i_croc_soc/i_croc/gen_sram_bank\[0\].i_sram/gen_512x32xBx1.i_cut}
set sram {\[1\].i_sram.}
set bank1_sram0 {i_croc_soc/i_croc/gen_sram_bank\[1\].i_sram/gen_512x32xBx1.i_cut}
set JTAG_CDC_REQ "i_croc_soc/i_croc/i_dmi_jtag/i_dmi_cdc.i_cdc_req"
set JTAG_ASYNC_REQ_START {}
set JTAG_ASYNC_REQ_END [list]
set JTAG_ASYNC_REQ_CANDIDATES {}
set req_async_nets [get_nets  -quiet $JTAG_CDC_REQ/*async_data*]
if {[llength $req_async_nets] > 0} {
    set JTAG_ASYNC_REQ_START [get_fanin -to $req_async_nets -flat -startpoints_only -only_cells]
}
set req_async_cells [get_cells -quiet $JTAG_CDC_REQ/*async*_o*_reg]
if {[llength $req_async_cells] > 0} {
    set JTAG_ASYNC_REQ_START [concat $JTAG_ASYNC_REQ_START $req_async_cells]
}
set req_async_data_nets [get_nets  -quiet $JTAG_CDC_REQ/*async*_data*]
if {[llength $req_async_data_nets] > 0} {
    set JTAG_ASYNC_REQ_CANDIDATES [get_fanout -from $req_async_data_nets -flat -endpoints_only -only_cells]
}
foreach cell $JTAG_ASYNC_REQ_CANDIDATES {
    if {[string match "${JTAG_CDC_REQ}/*" [get_name $cell]]} {
        lappend JTAG_ASYNC_REQ_END $cell
    }
}
set req_reset_pins [get_pins  -quiet $JTAG_CDC_REQ/*i_cdc_reset_ctrlr_half_a*async_data*_reg/Q]
if {[llength $req_reset_pins] > 0} {
    lappend JTAG_ASYNC_REQ_END {*}[get_fanout -from $req_reset_pins -flat -endpoints_only -only_cells]
}
# The same for the response CDC
set JTAG_CDC_RSP "i_croc_soc/i_croc/i_dmi_jtag/i_dmi_cdc.i_cdc_resp"
set JTAG_ASYNC_RSP_START {}
set JTAG_ASYNC_RSP_END [list]
set JTAG_ASYNC_RSP_CANDIDATES {}
set rsp_async_nets [get_nets -quiet $JTAG_CDC_RSP/*async_data*]
if {[llength $rsp_async_nets] > 0} {
    set JTAG_ASYNC_RSP_START [get_fanin -to $rsp_async_nets -flat -startpoints_only -only_cells]
}
set rsp_async_cells [get_cells -quiet $JTAG_CDC_RSP/*async*_o*_reg]
if {[llength $rsp_async_cells] > 0} {
    set JTAG_ASYNC_RSP_START [concat $JTAG_ASYNC_RSP_START $rsp_async_cells]
}
set rsp_async_data_nets [get_nets -quiet $JTAG_CDC_RSP/*async*_data*]
if {[llength $rsp_async_data_nets] > 0} {
    set JTAG_ASYNC_RSP_CANDIDATES [get_fanout -from $rsp_async_data_nets -flat -endpoints_only -only_cells]
}
foreach cell $JTAG_ASYNC_RSP_CANDIDATES {
    if {[string match "${JTAG_CDC_RSP}/*" [get_name $cell]]} {
        lappend JTAG_ASYNC_RSP_END $cell
    }
}
set rsp_reset_pins [get_pins -quiet $JTAG_CDC_RSP/*i_cdc_reset_ctrlr_half_a*async_data*_reg/Q]
if {[llength $rsp_reset_pins] > 0} {
    lappend JTAG_ASYNC_RSP_END {*}[get_fanout -from $rsp_reset_pins -flat -endpoints_only -only_cells]
}