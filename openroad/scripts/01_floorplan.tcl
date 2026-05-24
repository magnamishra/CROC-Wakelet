# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

# Authors:
# - Tobias Senti      <tsenti@ethz.ch>
# - Jannis Schönleber <janniss@iis.ee.ethz.ch>
# - Philippe Sauter   <phsauter@iis.ee.ethz.ch>
# - Changes for Wakelet 
#   - Change chip dimension at 65% utilization for 16 SRAM macros from Wakelet
#   - Wakelet's memories are SCM 
#   - P&R v1
#   - P&R v2 
#   - Wakelet uses SRAM
#   - Core area expanded 
# Stage 01: Initialization, Floorplan, and Power Grid
#
# This stage performs:
# - Reading and linking the netlist
# - Reading timing constraints
# - Connecting global power nets
# - Creating the floorplan (die/core area, macro placement, IO placement)
# - Generating the power distribution network
#
# Required environment variables:
#   PROJ_NAME    - Project name (e.g., "croc")
#   NETLIST      - Path to synthesized netlist
#   TOP_DESIGN   - Top module name
#
# Output checkpoint: 01_${PROJ_NAME}.floorplan

###############################################################################
# Setup
###############################################################################
source scripts/startup.tcl

utl::report "###############################################################################"
utl::report "# Stage 01: FLOORPLAN"
utl::report "###############################################################################"

utl::report "###############################################################################"
utl::report "# 01-01: Initialization"
utl::report "###############################################################################"

# Read and check design
utl::report "Read netlist: ${netlist}"
read_verilog $netlist
link_design $top_design

utl::report "Read constraints"
read_sdc src/constraints.sdc

utl::report "Check constraints"
check_setup -verbose                                      > ${report_dir}/01-01_${proj_name}_checks.rpt
report_checks -unconstrained -format end -no_line_splits >> ${report_dir}/01-01_${proj_name}_checks.rpt
report_checks -format end -no_line_splits                >> ${report_dir}/01-01_${proj_name}_checks.rpt
report_checks -format end -no_line_splits                >> ${report_dir}/01-01_${proj_name}_checks.rpt
utl::report "Connect global nets (power)"
source scripts/power_connect.tcl


utl::report "###############################################################################"
utl::report "# 01-02: Core and Die Area"
utl::report "###############################################################################"
# Dimensions:                          [um]
#   final chip size (4sqmm) 2000.0 x 2000.0
#   seal ring thickness       42.0 ,   42.0 x2
#   bonding pad               70.0 ,   70.0 x2
#   io cell depth            180.0 ,  180.0 x2
#   ---------------------------------------
#   -> OR die area          1916.0 x 1916.0
#   -> OR core area         1416.0 x 1416.0
# The sealring is added after OpenROAD
# hence the OR die area is the final chip size minus the sealring thickness on each side

#chip dimensions altered for Wakelet 
# Dimensions:    P&R v1     [um]
#   final chip size (4sqmm) 3750.0 x 3750.0
#   seal ring thickness       42.0 ,   42.0 x2
#   bonding pad               70.0 ,   70.0 x2
#   io cell depth            180.0 ,  180.0 x2
#   ---------------------------------------
#   -> OR die area          3666.0 x 3666.0
#   -> OR core area         3006.0 x 3006.0
#   65% conservative utilization

set chipH    3666; # OR die height (top to bottom)
set chipW    3666; # OR die width (left to right)
set padD      180; # pad depth (edge to core)
set padW       80; # pad width (beachfront)
set padBond    70; # bonding pad size
set powerRing  80; # reserved space for power ring

# starting from the outside and working towards the core area on each side
set coreMargin [expr {$padD + $padBond + $powerRing}];

utl::report "Initialize Chip"
# coordinates are lower-left x and y, upper-right x and y
initialize_floorplan -die_area "0 0 $chipW $chipH" \
                     -core_area "$coreMargin $coreMargin [expr $chipW-$coreMargin] [expr $chipH-$coreMargin]" \
                     -site "CoreSite"


utl::report "###############################################################################"
utl::report "# 01-03: Padring"
utl::report "###############################################################################"
source src/padring.tcl

##########################################################################
# RAM sizes
##########################################################################
set RamMaster256x64   [[ord::get_db] findMaster "RM_IHPSG13_1P_256x64_c2_bm_bist"]
set RamSize256x64_W   [ord::dbu_to_microns [$RamMaster256x64 getWidth]]
set RamSize256x64_H   [ord::dbu_to_microns [$RamMaster256x64 getHeight]]

set RamMaster64x64    [[ord::get_db] findMaster "RM_IHPSG13_1P_64x64_c2_bm_bist"]
set RamSize64x64_W    [ord::dbu_to_microns [$RamMaster64x64 getWidth]]
set RamSize64x64_H    [ord::dbu_to_microns [$RamMaster64x64 getHeight]]

##########################################################################
# Chip and Core Area
##########################################################################
set coreArea      [ord::get_core_area]
set core_leftX    [lindex $coreArea 0]
set core_bottomY  [lindex $coreArea 1]
set core_rightX   [lindex $coreArea 2]
set core_topY     [lindex $coreArea 3]

##########################################################################
# Tracks
##########################################################################
make_tracks

set siteHeight [ord::dbu_to_microns [[dpl::get_row_site] getHeight]]

##########################################################################
# Macro Placement
##########################################################################
utl::report "Macro Names"
source src/instances.tcl

set floorPaddingX     12.0
set floorPaddingY     12.0
set bankGap            2.0

set floor_leftX   [expr $core_leftX  + $floorPaddingX]
set floor_bottomY [expr $core_bottomY + $floorPaddingY]
set floor_rightX  [expr $core_rightX  - $floorPaddingX]
set floor_topY    [expr $core_topY    - $floorPaddingY]
set floor_midX    [expr $floor_leftX  + ($floor_rightX - $floor_leftX) / 2.0]

utl::report "Place Macros"

# -----------------------------------------------------------------------
# CROC SRAMs centered, hugging top and bottom edges
# -----------------------------------------------------------------------
# CROC SRAM 0 R0, top edge, pins face down into core
set X [expr $floor_midX - $RamSize256x64_W / 2.0]
set Y [expr $floor_topY - $RamSize256x64_H]
placeInstance $bank0_sram0 $X $Y R0

# CROC SRAM 1 MX, bottom edge, pins face up into core
set X [expr $floor_midX - $RamSize256x64_W / 2.0]
set Y $floor_bottomY
placeInstance $bank1_sram0 $X $Y MX

# -----------------------------------------------------------------------
# Activation banks 0-7 top area, R0 (pins face down into core)
# Stack A: banks 0,1,2,3 left of center
# Stack B: banks 4,5,6,7 right of center
# -----------------------------------------------------------------------
set stackTop [expr $floor_topY - $RamSize256x64_H - $bankGap]

# Stack A (banks 0-3) left
set X $floor_leftX
for {set i 0} {$i < 4} {incr i} {
    set Y [expr $stackTop - ($i + 1) * $RamSize64x64_H - $i * $bankGap]
    placeInstance $wl_act_sram($i) $X $Y R0
}

# Stack B (banks 4-7)  right
set X [expr $floor_rightX - $RamSize64x64_W]
for {set i 4} {$i < 8} {incr i} {
    set idx [expr $i - 4]
    set Y [expr $stackTop - ($idx + 1) * $RamSize64x64_H - $idx * $bankGap]
    placeInstance $wl_act_sram($i) $X $Y R0
}

# -----------------------------------------------------------------------
# Wakelet instr + data memories centered, below top bank stacks
# -----------------------------------------------------------------------
set memY [expr $stackTop - 4 * $RamSize64x64_H - 3 * $bankGap - 20.0 - $RamSize64x64_H]
set X_instr [expr $floor_midX - $RamSize64x64_W - 40.0]
set X_data  [expr $floor_midX + 40.0]
placeInstance $WL_INSTR $X_instr $memY R0
placeInstance $WL_DATA  $X_data  $memY R0

# -----------------------------------------------------------------------
# Activation banks 8-15  bottom area, R180 (pins face up into core)
# Stack C: banks 8,9,10,11  left of center
# Stack D: banks 12,13,14,15 right of center
# -----------------------------------------------------------------------
set stackBot [expr $floor_bottomY + $RamSize256x64_H + $bankGap]

# Stack C (banks 8-11) left
set X $floor_leftX
for {set i 8} {$i < 12} {incr i} {
    set idx [expr $i - 8]
    set Y [expr $stackBot + $idx * $RamSize64x64_H + $idx * $bankGap]
    placeInstance $wl_act_sram($i) $X $Y R180
}

# Stack D (banks 12-15) right
set X [expr $floor_rightX - $RamSize64x64_W]
for {set i 12} {$i < 16} {incr i} {
    set idx [expr $i - 12]
    set Y [expr $stackBot + $idx * $RamSize64x64_H + $idx * $bankGap]
    placeInstance $wl_act_sram($i) $X $Y R180
}

# -----------------------------------------------------------------------
insertTapCells
cut_rows -halo_width_x 1 -halo_width_y 1
global_connect

utl::report "###############################################################################"
utl::report "# 01-04: Power Grid"
utl::report "###############################################################################"
source scripts/power_grid.tcl

# Save checkpoint
save_checkpoint 01_${proj_name}.floorplan
report_image "01_${proj_name}.floorplan" true

utl::report "###############################################################################"
utl::report "# Stage 01 complete: Checkpoint saved to ${save_dir}/01_${proj_name}.floorplan.zip"
utl::report "###############################################################################"

