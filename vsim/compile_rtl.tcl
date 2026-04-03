# This script was generated automatically by bender.
set ROOT ".."

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "$ROOT/rtl/common_verification/clk_rst_gen.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "$ROOT/rtl/tech_cells_generic/tc_sram.sv" \
    "$ROOT/rtl/tech_cells_generic/tc_sram_impl.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "$ROOT/rtl/tech_cells_generic/tc_clk.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/common_cells/binary_to_gray.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/common_cells/cb_filter_pkg.sv" \
    "$ROOT/rtl/common_cells/cc_onehot.sv" \
    "$ROOT/rtl/common_cells/cdc_reset_ctrlr_pkg.sv" \
    "$ROOT/rtl/common_cells/cf_math_pkg.sv" \
    "$ROOT/rtl/common_cells/clk_int_div.sv" \
    "$ROOT/rtl/common_cells/credit_counter.sv" \
    "$ROOT/rtl/common_cells/delta_counter.sv" \
    "$ROOT/rtl/common_cells/ecc_pkg.sv" \
    "$ROOT/rtl/common_cells/edge_propagator_tx.sv" \
    "$ROOT/rtl/common_cells/exp_backoff.sv" \
    "$ROOT/rtl/common_cells/fifo_v3.sv" \
    "$ROOT/rtl/common_cells/gray_to_binary.sv" \
    "$ROOT/rtl/common_cells/heaviside.sv" \
    "$ROOT/rtl/common_cells/isochronous_4phase_handshake.sv" \
    "$ROOT/rtl/common_cells/isochronous_spill_register.sv" \
    "$ROOT/rtl/common_cells/lfsr.sv" \
    "$ROOT/rtl/common_cells/lfsr_16bit.sv" \
    "$ROOT/rtl/common_cells/lfsr_8bit.sv" \
    "$ROOT/rtl/common_cells/lossy_valid_to_stream.sv" \
    "$ROOT/rtl/common_cells/mv_filter.sv" \
    "$ROOT/rtl/common_cells/onehot_to_bin.sv" \
    "$ROOT/rtl/common_cells/plru_tree.sv" \
    "$ROOT/rtl/common_cells/passthrough_stream_fifo.sv" \
    "$ROOT/rtl/common_cells/popcount.sv" \
    "$ROOT/rtl/common_cells/ring_buffer.sv" \
    "$ROOT/rtl/common_cells/rr_arb_tree.sv" \
    "$ROOT/rtl/common_cells/rstgen_bypass.sv" \
    "$ROOT/rtl/common_cells/serial_deglitch.sv" \
    "$ROOT/rtl/common_cells/shift_reg.sv" \
    "$ROOT/rtl/common_cells/shift_reg_gated.sv" \
    "$ROOT/rtl/common_cells/spill_register_flushable.sv" \
    "$ROOT/rtl/common_cells/stream_demux.sv" \
    "$ROOT/rtl/common_cells/stream_filter.sv" \
    "$ROOT/rtl/common_cells/stream_fork.sv" \
    "$ROOT/rtl/common_cells/stream_intf.sv" \
    "$ROOT/rtl/common_cells/stream_join_dynamic.sv" \
    "$ROOT/rtl/common_cells/stream_mux.sv" \
    "$ROOT/rtl/common_cells/stream_throttle.sv" \
    "$ROOT/rtl/common_cells/sub_per_hash.sv" \
    "$ROOT/rtl/common_cells/sync.sv" \
    "$ROOT/rtl/common_cells/sync_wedge.sv" \
    "$ROOT/rtl/common_cells/unread.sv" \
    "$ROOT/rtl/common_cells/read.sv" \
    "$ROOT/rtl/common_cells/addr_decode_dync.sv" \
    "$ROOT/rtl/common_cells/boxcar.sv" \
    "$ROOT/rtl/common_cells/cdc_2phase.sv" \
    "$ROOT/rtl/common_cells/cdc_4phase.sv" \
    "$ROOT/rtl/common_cells/clk_int_div_static.sv" \
    "$ROOT/rtl/common_cells/trip_counter.sv" \
    "$ROOT/rtl/common_cells/addr_decode.sv" \
    "$ROOT/rtl/common_cells/addr_decode_napot.sv" \
    "$ROOT/rtl/common_cells/multiaddr_decode.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/common_cells/cb_filter.sv" \
    "$ROOT/rtl/common_cells/cdc_fifo_2phase.sv" \
    "$ROOT/rtl/common_cells/clk_mux_glitch_free.sv" \
    "$ROOT/rtl/common_cells/counter.sv" \
    "$ROOT/rtl/common_cells/ecc_decode.sv" \
    "$ROOT/rtl/common_cells/ecc_encode.sv" \
    "$ROOT/rtl/common_cells/edge_detect.sv" \
    "$ROOT/rtl/common_cells/lzc.sv" \
    "$ROOT/rtl/common_cells/max_counter.sv" \
    "$ROOT/rtl/common_cells/rstgen.sv" \
    "$ROOT/rtl/common_cells/spill_register.sv" \
    "$ROOT/rtl/common_cells/stream_delay.sv" \
    "$ROOT/rtl/common_cells/stream_fifo.sv" \
    "$ROOT/rtl/common_cells/stream_fork_dynamic.sv" \
    "$ROOT/rtl/common_cells/stream_join.sv" \
    "$ROOT/rtl/common_cells/cdc_reset_ctrlr.sv" \
    "$ROOT/rtl/common_cells/cdc_fifo_gray.sv" \
    "$ROOT/rtl/common_cells/fall_through_register.sv" \
    "$ROOT/rtl/common_cells/id_queue.sv" \
    "$ROOT/rtl/common_cells/stream_to_mem.sv" \
    "$ROOT/rtl/common_cells/stream_arbiter_flushable.sv" \
    "$ROOT/rtl/common_cells/stream_fifo_optimal_wrap.sv" \
    "$ROOT/rtl/common_cells/stream_register.sv" \
    "$ROOT/rtl/common_cells/stream_xbar.sv" \
    "$ROOT/rtl/common_cells/cdc_fifo_gray_clearable.sv" \
    "$ROOT/rtl/common_cells/cdc_2phase_clearable.sv" \
    "$ROOT/rtl/common_cells/mem_to_banks_detailed.sv" \
    "$ROOT/rtl/common_cells/stream_arbiter.sv" \
    "$ROOT/rtl/common_cells/stream_omega_net.sv" \
    "$ROOT/rtl/common_cells/mem_to_banks.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/apb/apb_pkg.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_pkg.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_intf.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_atop_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_burst_splitter_gran.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_burst_unwrap.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_bus_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_cdc_dst.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_cdc_src.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_cut.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_delayer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_demux_simple.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_dw_downsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_dw_upsizer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_fifo.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_fifo_delay_dyn.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_id_remap.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_id_prepend.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_inval_filter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_isolate.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_from_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_mailbox.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_regs.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_modify_address.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_mux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_rw_join.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_rw_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_serializer.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_slave_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_throttle.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_detailed_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_burst_splitter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_cdc.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_demux.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_dw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_from_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_id_serialize.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_multicut.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_axi_lite.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_zero_mem.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_interleaved_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_iw_converter.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_lite_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_xbar_unmuxed.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_mem_banked.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_mem_interleaved.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_to_mem_split.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_xbar.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_xp.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_chan_compare.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_dumper.sv" \
    "$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/src/axi_sim_mem.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_intf.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/apb_to_reg_v2.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/axi_lite_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/axi_to_reg_v2.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/periph_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_cdc.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_cut.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_demux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_err_slv.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_filter_empty_writes.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_mux.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_to_apb.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_to_mem.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_to_tlul.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_to_axi.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/reg_uniform.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/vendor/lowrisc_opentitan/src/prim_subreg_shadow.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/vendor/lowrisc_opentitan/src/prim_subreg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/deprecated/apb_to_reg.sv" \
    "$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/src/deprecated/axi_to_reg.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco" \
    "+incdir+$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/tcdm_interconnect/tcdm_interconnect_pkg.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/tcdm_interconnect/addr_dec_resp_mux.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/tcdm_interconnect/amo_shim.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/variable_latency_interconnect/addr_decoder.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/tcdm_interconnect/xbar.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/variable_latency_interconnect/simplex_xbar.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/tcdm_interconnect/clos_net.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/tcdm_interconnect/bfly_net.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/variable_latency_interconnect/full_duplex_xbar.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/tcdm_interconnect/tcdm_interconnect.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/variable_latency_interconnect/variable_latency_bfly_net.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/variable_latency_interconnect/variable_latency_interconnect.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/FanInPrimitive_Req.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/ArbitrationTree.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/MUX2_REQ.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/AddressDecoder_Resp.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/TestAndSet.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/RequestBlock2CH.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/RequestBlock1CH.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/FanInPrimitive_Resp.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/ResponseTree.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/ResponseBlock.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/AddressDecoder_Req.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/XBAR_TCDM.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/XBAR_TCDM_WRAPPER.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/TCDM_PIPE_REQ.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/TCDM_PIPE_RESP.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/grant_mask.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco/priority_Flag_Req.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/AddressDecoder_PE_Req.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/AddressDecoder_Resp_PE.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/ArbitrationTree_PE.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/FanInPrimitive_Req_PE.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/RR_Flag_Req_PE.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/MUX2_REQ_PE.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/FanInPrimitive_PE_Resp.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/RequestBlock1CH_PE.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/RequestBlock2CH_PE.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/ResponseBlock_PE.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/ResponseTree_PE.sv" \
    "$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco/XBAR_PE.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/defs_div_sqrt_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/iteration_div_sqrt_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/control_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/norm_div_sqrt_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/preprocess_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/nrbd_nrsc_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/div_sqrt_top_mvp.sv" \
    "$ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-410a967eb4a90b69/hdl/div_sqrt_mvp_wrapper.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/hwpe_stream_package.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/hwpe_stream_interfaces.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/basic/hwpe_stream_assign.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/basic/hwpe_stream_buffer.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/basic/hwpe_stream_demux_static.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/basic/hwpe_stream_deserialize.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/basic/hwpe_stream_fence.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/basic/hwpe_stream_merge.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/basic/hwpe_stream_mux_static.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/basic/hwpe_stream_serialize.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/basic/hwpe_stream_split.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/fifo/hwpe_stream_fifo_ctrl.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/fifo/hwpe_stream_fifo_scm.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/streamer/hwpe_stream_addressgen.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/streamer/hwpe_stream_addressgen_v2.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/streamer/hwpe_stream_addressgen_v3.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/streamer/hwpe_stream_sink_realign.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/streamer/hwpe_stream_source_realign.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/streamer/hwpe_stream_strbgen.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/streamer/hwpe_stream_streamer_queue.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/tcdm/hwpe_stream_tcdm_assign.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/tcdm/hwpe_stream_tcdm_mux.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/tcdm/hwpe_stream_tcdm_mux_static.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/tcdm/hwpe_stream_tcdm_reorder.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/tcdm/hwpe_stream_tcdm_reorder_static.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/fifo/hwpe_stream_fifo_earlystall.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/fifo/hwpe_stream_fifo_earlystall_sidech.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/fifo/hwpe_stream_fifo_scm_test_wrap.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/fifo/hwpe_stream_fifo_sidech.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/fifo/hwpe_stream_fifo.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/tcdm/hwpe_stream_tcdm_fifo_load_sidech.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/fifo/hwpe_stream_fifo_passthrough.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/streamer/hwpe_stream_source.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/tcdm/hwpe_stream_tcdm_fifo.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/tcdm/hwpe_stream_tcdm_fifo_load.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/tcdm/hwpe_stream_tcdm_fifo_store.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-stream-9deb3f878ca0b336/rtl/streamer/hwpe_stream_sink.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/l2_tcdm_demux.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/lint_2_apb.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/lint_2_axi.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/axi_2_lint/axi64_2_lint32.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/axi_2_lint/axi_read_ctrl.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/axi_2_lint/axi_write_ctrl.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/axi_2_lint/lint64_to_32.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/AddressDecoder_Req_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/AddressDecoder_Resp_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/ArbitrationTree_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/FanInPrimitive_Req_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/FanInPrimitive_Resp_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/MUX2_REQ_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/RequestBlock_L2_1CH.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/RequestBlock_L2_2CH.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/ResponseBlock_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/ResponseTree_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/RR_Flag_Req_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_L2/XBAR_L2.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/AddressDecoder_Req_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/AddressDecoder_Resp_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/ArbitrationTree_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/FanInPrimitive_Req_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/FanInPrimitive_Resp_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/MUX2_REQ_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/RequestBlock1CH_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/RequestBlock2CH_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/ResponseBlock_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/ResponseTree_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/RR_Flag_Req_BRIDGE.sv" \
    "$ROOT/.bender/git/checkouts/l2_tcdm_hybrid_interco-792033f664084ef5/RTL/XBAR_BRIDGE/XBAR_BRIDGE.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/obi/obi_pkg.sv" \
    "$ROOT/rtl/obi/obi_intf.sv" \
    "$ROOT/rtl/obi/obi_rready_converter.sv" \
    "$ROOT/rtl/obi/apb_to_obi.sv" \
    "$ROOT/rtl/obi/obi_to_apb.sv" \
    "$ROOT/rtl/obi/obi_atop_resolver.sv" \
    "$ROOT/rtl/obi/obi_cut.sv" \
    "$ROOT/rtl/obi/obi_demux.sv" \
    "$ROOT/rtl/obi/obi_err_sbr.sv" \
    "$ROOT/rtl/obi/obi_mux.sv" \
    "$ROOT/rtl/obi/obi_sram_shim.sv" \
    "$ROOT/rtl/obi/obi_xbar.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ODRG_unit/odrg_manager_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ecc_wrap/ecc_manager_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/pulpissimo_tcls/tcls_manager_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_13_8_cor.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_13_8_dec.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_13_8_enc.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_22_16_cor.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_22_16_dec.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_22_16_enc.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_39_32_cor.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_39_32_dec.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_39_32_enc.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_72_64_cor.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_72_64_dec.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_72_64_enc.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/lowrisc_ecc/prim_secded_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ODRG_unit/triple_core_barrier.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/hsiao_ecc/hsiao_ecc_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/hsiao_ecc/hsiao_ecc_enc.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/hsiao_ecc/hsiao_ecc_dec.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/hsiao_ecc/hsiao_ecc_cor.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/TMR_voter.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/TMR_word_voter.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/resp_suppress.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ODRG_unit/odrg_manager_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ecc_wrap/ecc_manager_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/pulpissimo_tcls/tcls_manager_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ecc_wrap/ecc_scrubber.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/TMR_voter_detect.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/bitwise_TMR_voter.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ecc_wrap/ecc_manager.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ecc_wrap/ecc_sram_wrap.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ODRG_unit" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/ODRG_unit/ODRG_unit.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/pulpissimo_tcls" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/pulpissimo_tcls/TCLS_unit.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/rapid_recovery_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/recovery_csr.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/recovery_pc.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/recovery_rf.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/rapid_recovery_unit.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/DMR_checker.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/DMR_CSR_checker.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/DMR_address_generator.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_rapid_recovery_ctrl.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_registers_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_core_regs_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_dmr_regs_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_tmr_regs_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_registers_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_core_regs_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_dmr_regs_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_dmr_ctrl.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_tmr_regs_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_tmr_ctrl.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/HMR_wrap.sv" \
    "$ROOT/.bender/git/checkouts/redundancy_cells-2eef3a9ddf6565f3/rtl/HMR/hmr_unit.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_1r_1w_all.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_1r_1w_be.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_1r_1w.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_1r_1w_1row.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_1r_1w_raw.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_1w_multi_port_read.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_1w_64b_multi_port_read_32b.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_1w_64b_1r_32b.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_2r_1w_asymm.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_2r_1w_asymm_test_wrap.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_2r_2w.sv" \
    "$ROOT/.bender/git/checkouts/scm-f6f8a9ee8befd5c6/fpga_scm/register_file_3r_2w.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/axi_riscv_atomics-0f8c8c39d7e5fcb1/src/axi_res_tbl.sv" \
    "$ROOT/.bender/git/checkouts/axi_riscv_atomics-0f8c8c39d7e5fcb1/src/axi_riscv_amos_alu.sv" \
    "$ROOT/.bender/git/checkouts/axi_riscv_atomics-0f8c8c39d7e5fcb1/src/axi_riscv_amos.sv" \
    "$ROOT/.bender/git/checkouts/axi_riscv_atomics-0f8c8c39d7e5fcb1/src/axi_riscv_lrsc.sv" \
    "$ROOT/.bender/git/checkouts/axi_riscv_atomics-0f8c8c39d7e5fcb1/src/axi_riscv_atomics.sv" \
    "$ROOT/.bender/git/checkouts/axi_riscv_atomics-0f8c8c39d7e5fcb1/src/axi_riscv_lrsc_wrap.sv" \
    "$ROOT/.bender/git/checkouts/axi_riscv_atomics-0f8c8c39d7e5fcb1/src/axi_riscv_amos_wrap.sv" \
    "$ROOT/.bender/git/checkouts/axi_riscv_atomics-0f8c8c39d7e5fcb1/src/axi_riscv_atomics_wrap.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_icache_pkg.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/riscv_instr_branch.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/multi_accept_rr_arb.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_axi_to_cache.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_icache_l0.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_icache_refill.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_icache_lfsr.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_icache_lookup_parallel.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_icache_lookup_serial.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_icache_handler.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_icache.sv" \
    "$ROOT/.bender/git/checkouts/cluster_icache-459d890edd8457ab/src/snitch_read_only_cache.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_pkg.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_cast_multi.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_classifier.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/clk/rtl/gated_clk_cell.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_ctrl.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_ff1.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_pack_single.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_prepare.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_round_single.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_special.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_srt_single.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fdsu/rtl/pa_fdsu_top.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fpu/rtl/pa_fpu_dp.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fpu/rtl/pa_fpu_frbus.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/vendor/opene906/E906_RTL_FACTORY/gen_rtl/fpu/rtl/pa_fpu_src_type.v" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_divsqrt_th_32.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_divsqrt_multi.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_fma.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_fma_multi.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_sdotp_multi.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_sdotp_multi_wrapper.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_noncomp.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_opgroup_block.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_opgroup_fmt_slice.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_opgroup_multifmt_slice.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_rounding.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/lfsr_sr.sv" \
    "$ROOT/.bender/git/checkouts/fpnew-2e56d83b4834f394/src/fpnew_top.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/low_latency_interco" \
    "+incdir+$ROOT/.bender/git/checkouts/cluster_interconnect-4d9b118d4aeb570e/rtl/peripheral_interco" \
    "+incdir+$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/common" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/common/hci_package.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/ecc/hci_ecc_manager_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/common/hci_interfaces.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/ecc/hci_ecc_manager_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_assign.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_assign_expand.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_fifo.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_mux_dynamic.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_mux_static.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_mux_ooo.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_r_valid_filter.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_r_id_filter.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_source.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_split.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/ecc/hci_ecc_dec.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/ecc/hci_ecc_enc.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/ecc/hci_ecc_manager.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/interco/hci_log_interconnect.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/interco/hci_log_interconnect_l2.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/interco/hci_new_log_interconnect.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/interco/hci_arbiter.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/interco/hci_arbiter_tree.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/interco/hci_router_reorder.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/parity/hci_copy_source.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/parity/hci_copy_sink.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/core/hci_core_sink.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/ecc/hci_ecc_source.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/interco/hci_router.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/ecc/hci_ecc_interconnect.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/ecc/hci_ecc_sink.sv" \
    "$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/hci_interconnect.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl" \
    "$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl/hwpe_ctrl_interfaces.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl/hwpe_ctrl_package.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl/hwpe_ctrl_regfile_latch.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl/hwpe_ctrl_partial_mult.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl/hwpe_ctrl_seq_mult.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl/hwpe_ctrl_uloop.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl/hwpe_ctrl_regfile_latch_test_wrap.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl/hwpe_ctrl_regfile.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-ctrl-e23a79d5135eef66/rtl/hwpe_ctrl_slave.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/idma/idma_pkg.sv" \
    "$ROOT/rtl/idma/idma_channel_coupler.sv" \
    "$ROOT/rtl/idma/idma_dataflow_element.sv" \
    "$ROOT/rtl/idma/idma_obi_read.sv" \
    "$ROOT/rtl/idma/idma_obi_write.sv" \
    "$ROOT/rtl/idma/idma_nd_midend.sv" \
    "$ROOT/rtl/idma/idma_transfer_id_gen.sv" \
    "$ROOT/rtl/idma/idma_legalizer_page_splitter.sv" \
    "$ROOT/rtl/idma/idma_transport_layer_rw_obi.sv" \
    "$ROOT/rtl/idma/idma_legalizer_rw_obi.sv" \
    "$ROOT/rtl/idma/idma_backend_rw_obi.sv" \
    "$ROOT/rtl/idma/croc_idma.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/riscv-dbg/dm_pkg.sv" \
    "$ROOT/rtl/riscv-dbg/debug_rom/debug_rom.sv" \
    "$ROOT/rtl/riscv-dbg/debug_rom/debug_rom_one_scratch.sv" \
    "$ROOT/rtl/riscv-dbg/dm_csrs.sv" \
    "$ROOT/rtl/riscv-dbg/dm_mem.sv" \
    "$ROOT/rtl/riscv-dbg/dmi_cdc.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/riscv-dbg/dmi_jtag_tap.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/riscv-dbg/dm_sba.sv" \
    "$ROOT/rtl/riscv-dbg/dm_top.sv" \
    "$ROOT/rtl/riscv-dbg/dmi_jtag.sv" \
    "$ROOT/rtl/riscv-dbg/dm_obi_top.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/riscv-dbg/dmi_test.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/riscv-dbg/tb/jtag_test_simple.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/common" \
    "$ROOT/.bender/git/checkouts/hwpe-datamover-example-cdb7c6aee1aaeff6/rtl/datamover_engine.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-datamover-example-cdb7c6aee1aaeff6/rtl/datamover_package.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-datamover-example-cdb7c6aee1aaeff6/rtl/datamover_streamer.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-datamover-example-cdb7c6aee1aaeff6/rtl/datamover_top.sv" \
    "$ROOT/.bender/git/checkouts/hwpe-datamover-example-cdb7c6aee1aaeff6/rtl/datamover_top_wrap.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/src/reqrsp_pkg.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/src/reqrsp_intf.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/src/axi_to_reqrsp.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/src/reqrsp_cut.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/src/reqrsp_demux.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/src/reqrsp_iso.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/src/reqrsp_mux.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/src/reqrsp_to_axi.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/src/reqrsp_test.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/src/mem_wide_narrow_mux.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/src/mem_interface.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/src/mem_test.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/src/tcdm_interface.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/src/axi_to_tcdm.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/src/reqrsp_to_tcdm.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/src/tcdm_mux.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/src/tcdm_test.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/src/snitch_pma_pkg.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/src/riscv_instr.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/src/snitch_pkg.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/src/snitch_regfile_ff.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/src/snitch_lsu.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/src/snitch_l0_tlb.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SNITCH_ENABLE_PERF" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/src/snitch.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_vm/src/snitch_ptw.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ipu/src/snitch_ipu_pkg.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ipu/src/snitch_ipu_alu.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ipu/src/snitch_int_ss.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/src/snitch_ssr_pkg.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/src/snitch_ssr_switch.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/src/snitch_ssr_credit_counter.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/src/snitch_ssr_indirector.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/src/snitch_ssr_intersector.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/src/snitch_ssr_addr_gen.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/src/snitch_ssr.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/src/snitch_ssr_streamer.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_amo_shim.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral_reg_pkg.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral_reg_top.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_cluster_peripheral/snitch_cluster_peripheral.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_fpu.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_sequencer.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_tcdm_interconnect.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/target/snitch_cluster/test/snitch_bootrom.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_barrier.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_fp_ss.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_shared_muldiv.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_cc.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_clkdiv2.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_hive.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_cluster/src/snitch_cluster.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/register_interface-8146d26ca39e5d02/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/target/common/test/tb_memory_regbus.sv" \
    "$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/target/common/test/tb_memory_axi.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/axi_obi/axi_to_detailed_mem_user.sv" \
    "$ROOT/rtl/axi_obi/axi_to_obi.sv" \
    "$ROOT/rtl/axi_obi/obi_to_axi.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/cve2/include" \
    "$ROOT/rtl/cve2/cve2_pkg.sv" \
    "$ROOT/rtl/cve2/cve2_alu.sv" \
    "$ROOT/rtl/cve2/cve2_branch_predict.sv" \
    "$ROOT/rtl/cve2/cve2_compressed_decoder.sv" \
    "$ROOT/rtl/cve2/cve2_controller.sv" \
    "$ROOT/rtl/cve2/cve2_counter.sv" \
    "$ROOT/rtl/cve2/cve2_csr.sv" \
    "$ROOT/rtl/cve2/cve2_decoder.sv" \
    "$ROOT/rtl/cve2/cve2_fetch_fifo.sv" \
    "$ROOT/rtl/cve2/cve2_load_store_unit.sv" \
    "$ROOT/rtl/cve2/cve2_multdiv_fast.sv" \
    "$ROOT/rtl/cve2/cve2_multdiv_slow.sv" \
    "$ROOT/rtl/cve2/cve2_pmp.sv" \
    "$ROOT/rtl/cve2/cve2_register_file_ff.sv" \
    "$ROOT/rtl/cve2/cve2_wb.sv" \
    "$ROOT/rtl/cve2/cve2_cs_registers.sv" \
    "$ROOT/rtl/cve2/cve2_ex_block.sv" \
    "$ROOT/rtl/cve2/cve2_id_stage.sv" \
    "$ROOT/rtl/cve2/cve2_prefetch_buffer.sv" \
    "$ROOT/rtl/cve2/cve2_if_stage.sv" \
    "$ROOT/rtl/cve2/cve2_core.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/obi_uart/obi_uart_pkg.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_baudgen.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_interrupts.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_modem.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_rx.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_tx.sv" \
    "$ROOT/rtl/obi_uart/obi_uart_register.sv" \
    "$ROOT/rtl/obi_uart/obi_uart.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/.bender/git/checkouts/hci-9ab0ec02f3ef398d/rtl/common" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/mem_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/reqrsp_interface/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/snitch_ssr/include" \
    "+incdir+$ROOT/.bender/git/checkouts/snitch_cluster-97c6a2948288073d/hw/tcdm_interface/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "$ROOT/rtl/wakelet/wl_pkg.sv" \
    "$ROOT/rtl/wakelet/snitch_bootrom.sv" \
    "$ROOT/rtl/wakelet/core_instr_mem.sv" \
    "$ROOT/rtl/wakelet/core_instr_demux.sv" \
    "$ROOT/rtl/wakelet/core_data_mem.sv" \
    "$ROOT/rtl/wakelet/core_data_demux.sv" \
    "$ROOT/rtl/wakelet/core_subsystem.sv" \
    "$ROOT/rtl/wakelet/wl_registers.sv" \
    "$ROOT/rtl/wakelet/adapter_axi2hci.sv" \
    "$ROOT/rtl/wakelet/hwpe_subsystem.sv" \
    "$ROOT/rtl/wakelet/wl_top.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/croc_pkg.sv" \
    "$ROOT/rtl/user_pkg.sv" \
    "$ROOT/rtl/soc_ctrl/soc_ctrl_regs_pkg.sv" \
    "$ROOT/rtl/gpio/gpio_reg_pkg.sv" \
    "$ROOT/rtl/clint/clint_reg_pkg.sv" \
    "$ROOT/rtl/obi_timer/obi_timer_reg_pkg.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/core_wrap.sv" \
    "$ROOT/rtl/bootrom/bootrom.sv" \
    "$ROOT/rtl/soc_ctrl/soc_ctrl_regs.sv" \
    "$ROOT/rtl/gpio/gpio_reg_top.sv" \
    "$ROOT/rtl/gpio/gpio.sv" \
    "$ROOT/rtl/clint/clint.sv" \
    "$ROOT/rtl/obi_timer/obi_timer.sv" \
    "$ROOT/rtl/croc_domain.sv" \
    "$ROOT/rtl/user_domain.sv" \
    "$ROOT/rtl/croc_soc.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/croc_chip.sv" \
}]} {return 1}

if {[catch { vlog -incr -sv \
    -svinputport=compat \
    "+define+TARGET_RTL" \
    "+define+TARGET_SIMULATION" \
    "+define+TARGET_VERILATOR" \
    "+define+TARGET_VSIM" \
    "+define+SYNTHESIS" \
    "+define+SIMULATION" \
    "+define+TARGET_WL_SRAM" \
    "+incdir+$ROOT/.bender/git/checkouts/axi-4ecab47b5e77b28c/include" \
    "+incdir+$ROOT/rtl/apb/include" \
    "+incdir+$ROOT/rtl/common_cells/include" \
    "+incdir+$ROOT/rtl/idma/include" \
    "+incdir+$ROOT/rtl/obi/include" \
    "$ROOT/rtl/test/tb_croc_pkg.sv" \
    "$ROOT/rtl/test/croc_vip.sv" \
    "$ROOT/rtl/test/tb_croc_soc.sv" \
}]} {return 1}

