// Copyright 2024 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Authors:
// - Philippe Sauter <phsauter@iis.ee.ethz.ch>
// - Enrico Zelioli  <ezelioli@iis.ee.ethz.ch>
// - Magna Mishra    < Only additions for Wakelet tests  >

/* Changes 
    - Add AXI drivers for sensor input 
*/

`include "axi/assign.svh"
`include "axi/typedef.svh"
`define TRACE_WAVE

module tb_croc_soc #(
  parameter int unsigned GpioCount = 32
);

  import tb_croc_pkg::*;
  import wl_pkg::*; 

  // Signals fully controlled by the VIP
  // use VIP functions/tasks to manipulate these signals
  logic rst_n;
  logic sys_clk;
  logic ref_clk;

  logic jtag_tck;
  logic jtag_trst_n;
  logic jtag_tms;
  logic jtag_tdi;
  logic jtag_tdo;

  logic uart_rx;
  logic uart_tx;

  // Signals partially controlled by the VIP
  logic [GpioCount-1:0] gpio_in;
  logic [GpioCount-1:0] gpio_out;
  logic [GpioCount-1:0] gpio_out_en;

  // Observe interrupt signals via hierarchical references
  logic wakeup_obs;
  logic wakelet_done_obs;

  assign wakeup_obs       = i_croc_soc.wakeup;
  assign wakelet_done_obs = i_croc_soc.ext_irq_i; 

  // Signals controlled by the testbench

  /////////////////////////////
  //  Command Line Arguments //
  /////////////////////////////

  string binary_path;

  initial begin
    // $value$plusargs defines what to look for (here +binary=...)
    if ($value$plusargs("binary=%s", binary_path)) begin
      $display("Running program: %s", binary_path);
    end else begin
      $display("No binary path provided. Running helloworld.");
      binary_path = "../sw/bin/helloworld.hex";
    end
  end

  ////////////
  //  VIP   //
  ////////////
  // Verification IP
  // - drives clocks and resets
  // - provides helper tasks and functions for JTAG, namely:
  //   - jtag_load_hex: loads a hex file into the DUT's memory
  //   - jtag_write_reg32: write 32-bit value to DUT
  //   - jtag_read_reg32: read 32-bit value from DUT
  //   - jtag_halt / jtag_resume: control core execution
  //   - jtag_wait_for_eoc: wait for end of code execution (core writes non-zero to status register)
  // - prints UART output to console (you can also write via uart_write_byte)
  // - internal GPIO loopback for helloworld test

  croc_vip #(
    .GpioCount ( GpioCount )
  ) i_vip (
    .rst_no        ( rst_n       ),
    .sys_clk_o     ( sys_clk     ),
    .ref_clk_o     ( ref_clk     ),
    .jtag_tck_o    ( jtag_tck    ),
    .jtag_trst_no  ( jtag_trst_n ),
    .jtag_tms_o    ( jtag_tms    ),
    .jtag_tdi_o    ( jtag_tdi    ),
    .jtag_tdo_i    ( jtag_tdo    ),
    .uart_rx_o     ( uart_rx     ),
    .uart_tx_i     ( uart_tx     ),
    .gpio_out_en_i ( gpio_out_en ),
    .gpio_out_i    ( gpio_out    ),
    .gpio_in_o     ( gpio_in     )
  );
  
  /////////////////////////////////
  // Wide AXI TB driver (sensor) //
  /////////////////////////////////

  AXI_BUS #(
    .AXI_ADDR_WIDTH ( wl_pkg::AxiAddrWidth  ),
    .AXI_DATA_WIDTH ( wl_pkg::AxiDataWidth  ),
    .AXI_ID_WIDTH   ( wl_pkg::AxiSlvIdWidth ),
    .AXI_USER_WIDTH ( wl_pkg::AxiUserWidth  )
  ) axi_wide_tb2dut ();

  wl_pkg::axi_req_t  axi_wide_tb2dut_req;
  wl_pkg::axi_resp_t axi_wide_tb2dut_rsp;

  `AXI_ASSIGN_TO_REQ(axi_wide_tb2dut_req, axi_wide_tb2dut)
  `AXI_ASSIGN_FROM_RESP(axi_wide_tb2dut, axi_wide_tb2dut_rsp)

  AXI_BUS_DV #(
    .AXI_ADDR_WIDTH ( wl_pkg::AxiAddrWidth  ),
    .AXI_DATA_WIDTH ( wl_pkg::AxiDataWidth  ),
    .AXI_ID_WIDTH   ( wl_pkg::AxiSlvIdWidth ),
    .AXI_USER_WIDTH ( wl_pkg::AxiUserWidth  )
  ) axi_wide_tb2dut_dv (sys_clk);

  `AXI_ASSIGN(axi_wide_tb2dut, axi_wide_tb2dut_dv)

  axi_test::axi_driver #(
    .AW ( wl_pkg::AxiAddrWidth  ),
    .DW ( wl_pkg::AxiDataWidth  ),
    .IW ( wl_pkg::AxiSlvIdWidth ),
    .UW ( wl_pkg::AxiUserWidth  ),
    .TA ( ClkPeriodSys * 0.2    ),
    .TT ( ClkPeriodSys * 0.8    )
  ) axi_wide_driver = new(axi_wide_tb2dut_dv);

  typedef axi_test::axi_ax_beat #(
    .AW(wl_pkg::AxiAddrWidth),
    .IW(wl_pkg::AxiSlvIdWidth),
    .UW(wl_pkg::AxiUserWidth)
  ) aw_beat_t;

  typedef axi_test::axi_w_beat #(
    .DW(wl_pkg::AxiDataWidth),
    .UW(wl_pkg::AxiUserWidth)
  ) w_beat_t;

  typedef axi_test::axi_b_beat #(
    .IW(wl_pkg::AxiSlvIdWidth),
    .UW(wl_pkg::AxiUserWidth)
  ) b_beat_t;

  // AXI Buffer Task - identical to Wakelet test bench

  task automatic send_axi_buffer (
    input logic [wl_pkg::AxiAddrWidth-1:0] base_addr,
    input logic [wl_pkg::AxiDataWidth-1:0] fill_data [],
    input int unsigned                      num_bytes
  );

    automatic aw_beat_t aw = new();
    automatic w_beat_t  w  = new();
    automatic b_beat_t  b  = new();
    automatic int unsigned num_beats = num_bytes / (wl_pkg::AxiDataWidth/8);

    aw.ax_id    = '0;
    aw.ax_addr  = base_addr;
    aw.ax_len   = num_beats - 1;
    aw.ax_size  = $clog2(wl_pkg::AxiDataWidth/8);
    aw.ax_burst = 2'b01;
    axi_wide_driver.send_aw(aw);

    for (int i = 0; i < num_beats; i++) begin
      w.w_data = fill_data[i];
      w.w_strb = '1;
      w.w_last = (i == num_beats - 1);
      w.w_user = '0;
      axi_wide_driver.send_w(w);
    end

    axi_wide_driver.recv_b(b);
    @(posedge sys_clk);
  endtask


  ////////////
  //  DUT   //
  ////////////

  `ifdef TARGET_NETLIST_YOSYS
  \croc_soc$croc_chip.i_croc_soc i_croc_soc (
  `else
  croc_soc #(
    .GpioCount ( GpioCount )
  ) i_croc_soc (
  `endif
    .clk_i         ( sys_clk     ),
    .rst_ni        ( rst_n       ),
    .ref_clk_i     ( ref_clk     ),
    .testmode_i    ( 1'b0        ),
    .status_o      (             ),
    .jtag_tck_i    ( jtag_tck    ),
    .jtag_tdi_i    ( jtag_tdi    ),
    .jtag_tdo_o    ( jtag_tdo    ),
    .jtag_tms_i    ( jtag_tms    ),
    .jtag_trst_ni  ( jtag_trst_n ),
    .uart_rx_i     ( uart_rx     ),
    .uart_tx_o     ( uart_tx     ),
    .gpio_i        ( gpio_in     ),
    .gpio_o        ( gpio_out    ),
    .gpio_out_en_o ( gpio_out_en ),
    .wl_axi_slv_req_i ( axi_wide_tb2dut_req ),
    .wl_axi_slv_rsp_o ( axi_wide_tb2dut_rsp )
  );

  /////////////////
  //  Testbench  //
  /////////////////

  logic [31:0] tb_data;

  initial begin
    $timeformat(-9, 0, "ns", 12); // 1: scale (ns=-9), 2: decimals, 3: suffix, 4: print-field width

    // wait for reset
    #ClkPeriodSys;

    // init jtag
    i_vip.jtag_init();

    // write test value to sram
    i_vip.jtag_write_reg32(SramBaseAddr, 32'h1234_5678, 1'b1);

    // load binary to sram
    i_vip.jtag_load_hex(binary_path);

    // wake core from WFI by writing to CLINT msip
    $display("@%t | [CORE] Waking core via CLINT msip", $time);
    i_vip.jtag_write_reg32(ClintBaseAddr, 32'h1);

    // halt core
    i_vip.jtag_halt();
    $display("@%t| halted core", $time);

    // resume core
    i_vip.jtag_resume();
    $display("@%t| resumed core", $time);

    //AXI test 
    // Initialize wide AXI driver
    axi_wide_driver.reset_master();

    // Initialize BUF_A and BUF_B to zeros
    begin
      automatic logic [wl_pkg::AxiDataWidth-1:0] zeros[];
      automatic int unsigned beats = 4096 / (wl_pkg::AxiDataWidth/8);
      zeros = new[beats];
      foreach (zeros[i]) zeros[i] = '0;
      send_axi_buffer(32'h2000_0000, zeros, 4096);  // BUF_A
      send_axi_buffer(32'h2000_1000, zeros, 4096);  // BUF_B
    end
    // Give Snitch time to configure datamover
    repeat(50000) @(posedge sys_clk);

    // Background sensor loop
    fork : sensor_process
    begin
      automatic int unsigned frame_num = 0;
      automatic logic [wl_pkg::AxiDataWidth-1:0] frame_data[];
      automatic int unsigned beats = 4096 / (wl_pkg::AxiDataWidth/8);
      frame_data = new[beats];
      repeat(5000) @(posedge sys_clk);

      forever begin
      frame_num++;
      foreach (frame_data[i])
        frame_data[i] = (frame_num >= 6 && i <= 5) ? '1 : '0;
        send_axi_buffer(32'h2000_1000, frame_data, 4096);
        $display("@%t | [SENSOR] Frame %0d written to BUF_B", $time, frame_num);
      repeat(666666) @(posedge sys_clk); //33ms at 20MHz
      end
    end
    join_none

    // Wait for wakelet_done or timeout
    fork
      begin : wait_wakelet
        @(posedge wakelet_done_obs);
        $display("@%t | [WAKELET] PASS: motion detected, wakelet_done asserted", $time);
        $finish(0);
      end
      begin : timeout
        repeat(5000000) @(posedge sys_clk);
        $error("@%t | [WAKELET] TIMEOUT", $time);
        $finish(1);
      end
    join_any
    disable fork;
   
    // wait for non-zero return value (written into core status register)
    $display("@%t | [CORE] Wait for end of code...", $time);
    i_vip.jtag_wait_for_eoc(tb_data);

    // finish simulation
    repeat(50) @(posedge sys_clk);
    $finish();
  end

  ////////////////
  //  Waveform  //
  ////////////////
  // start waveform dump at time 0, independent of stimuli
  initial begin
    `ifdef TRACE_WAVE
      `ifdef VERILATOR
        $dumpfile("croc.fst");
        $dumpvars(1, i_croc_soc);
      `else
        $dumpfile("croc.vcd");
        $dumpvars(1, i_croc_soc);
      `endif
    `endif
  end

  // flush waveform dump when simulation ends
  final begin
    `ifdef TRACE_WAVE
      $dumpflush;
    `endif
  end

endmodule

