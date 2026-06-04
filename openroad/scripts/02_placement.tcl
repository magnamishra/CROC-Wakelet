# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

# Authors:
# - Tobias Senti      <tsenti@ethz.ch>
# - Jannis Schönleber <janniss@iis.ee.ethz.ch>
# - Philippe Sauter   <phsauter@iis.ee.ethz.ch>

# Stage 02: Placement (Repair Netlist + Global Placement + Detailed Placement)
#
# This stage performs:
# - Initial repair of the netlist (tie cells, buffers)
# - Global placement (2-pass: rough + routability-driven)
# - Detailed placement (legalization)
#
# Required environment variables:
#   PROJ_NAME    - Project name (e.g., "croc")
#   TOP_DESIGN   - Top module name
#
# Input checkpoint: 01_${PROJ_NAME}.floorplan
# Output checkpoint: 02_${PROJ_NAME}.placed
# Changes for Wakelet 
#  -Add input capacitance at SRAM for OpenROAD (reverted)
#  -Add placememnt padding for CROC SRAM 

###############################################################################
# Setup
###############################################################################
source scripts/startup.tcl

# Load checkpoint from previous stage
load_checkpoint 01_${proj_name}.floorplan

# Set layers used for estimate_parasitics
setDefaultParasitics
set_dont_use $dont_use_cells


utl::report "###############################################################################"
utl::report "# Stage 02: PLACEMENT"
utl::report "###############################################################################"

utl::report "###############################################################################"
utl::report "# 02-01: Initial Repair Netlist"
utl::report "###############################################################################"

# Don't touch clock-tree related nets as repair_timing can insert buffers
# which then prevents CTS from running
set clock_nets [get_nets -of_objects [get_pins -of_objects "*_reg" -filter "name == CLK"]]
set_dont_touch $clock_nets

utl::report "Repair tie fanout"
repair_tie_fanout $tieHiPin 
repair_tie_fanout $tieLoPin 

utl::report "Remove buffers"
remove_buffers

utl::report "Repair design"
# Try setting on all pins matching the SRAM output pattern
# Relax max cap on SRAM output pins (IHP130 liberty has unreasonably small 6.4e-14 pF -> RSZ-0169)
#set_max_capacitance 0.5 [get_lib_pins RM_IHPSG13_1P_256x64_c2_bm_bist/A_DOUT*]
set_max_fanout 8 [current_design]
repair_design -verbose

save_checkpoint 02-01_${proj_name}.pre_place


utl::report "###############################################################################"
utl::report "# 02-02: Global Placement"
utl::report "###############################################################################"

set_thread_count 8

# global_placement parameters:
# density:            In every part of the chip, about N% of the area is occupied by standard cells
# routability_driven: Reduce density target when there are a lot of wires in an area
# check_overflow:     Higher means routability starts being considered earlier in placement
#                     too early -> very dense regions, too late -> little to no effect
# timing_driven:      Prioritize near-critical timing paths (reduce their length)

#Move macro placement to pre global and add extra pad around pins
set_placement_padding -masters "RM_IHPSG13_1P_256x64_c2_bm_bist" -left 4 -right 4
# Rough placement to get parasitics from steiner-tree estimate so we can run repair_timing
utl::report "Global Placement (1)"
global_placement -density 0.55
report_metrics "02-02_${proj_name}.gpl1"
report_image "02-02_${proj_name}.gpl1" true true
save_checkpoint 02-02_${proj_name}.gpl1

utl::report "Estimate parasitics"
estimate_parasitics -placement
set_max_fanout 8 [current_design]
utl::report "Repair design"
repair_design -verbose
save_checkpoint 02-02_${proj_name}.gpl1_fix
set_max_fanout 8 [current_design]
utl::report "Repair setup"
repair_timing -setup -verbose
save_checkpoint 02-02_${proj_name}.gpl1_repaired

# Actual global placement with routability and timing driven
utl::report "Global Placement (2)"
global_placement -density 0.55 \
                 -routability_driven \
                 -routability_check_overflow 0.30 \
                 -timing_driven
report_metrics "02-02_${proj_name}.gpl2"
report_image "02-02_${proj_name}.gpl2" true true
save_checkpoint 02-02_${proj_name}.gpl2

#set_placement_padding -masters "RM_IHPSG13_1P_256x64_c2_bm_bist" -left 4 -right 4

utl::report "###############################################################################"
utl::report "# 02-03: Detailed Placement"
utl::report "###############################################################################"


# Legalize overlapping cells
utl::report "Detailed placement"
detailed_placement

utl::report "Optimize mirroring"
optimize_mirroring

utl::report "Estimate parasitics"
estimate_parasitics -placement

report_metrics "02_${proj_name}.placed"
save_checkpoint 02_${proj_name}.placed
report_image "02_${proj_name}.placed" true true

utl::report "###############################################################################"
utl::report "# Stage 02 complete: Checkpoint saved to ${save_dir}/02_${proj_name}.placed.zip"
utl::report "###############################################################################"
