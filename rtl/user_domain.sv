// Copyright 2024 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Authors:
// - Philippe Sauter <phsauter@iis.ee.ethz.ch>
// - Magna Mishra    <  for Wakelet integration only >

///////////////////////////////////////////////////////////////////////////
////////////For Wakelet //////////////////////////////////////////////////
// collect User Subordinate signals /////////////////////////////////////
// integrate into wrapper for OBI to AXI bridge ////////////////////////
// output from wrapper heads into Wakelet Domain as an AXI-lite signal/
//////////////////////////////////////////////////////////////////////


module user_domain import user_pkg::*; import croc_pkg::*; import wl_pkg::*; #(
  parameter int unsigned GpioCount = 16,
  parameter int unsigned NumExternalIrqs = 4
) (
  input  logic      clk_i,
  input  logic      ref_clk_i,
  input  logic      rst_ni,
  input  logic      testmode_i,

  input  sbr_obi_req_t user_sbr_obi_req_i, // User Sbr (rsp_o), Croc Mgr (req_i)
  output sbr_obi_rsp_t user_sbr_obi_rsp_o,

  output mgr_obi_req_t user_mgr_obi_req_o, // User Mgr (req_o), Croc Sbr (rsp_i)
  input  mgr_obi_rsp_t user_mgr_obi_rsp_i, // Tied off to 0 for integrating Wakelet

  input  logic [      GpioCount-1:0] gpio_in_sync_i, // synchronized GPIO inputs
  output logic [NumExternalIrqs-1:0] interrupts_o    // interrupts to core
);

  ///Wakelet interrupt gets tied off here 
  assign interrupts_o = '0;


  //////////////////////
  // User Manager MUX //
  /////////////////////

  // No manager so we don't need a obi_mux module and just terminate the request properly
  assign user_mgr_obi_req_o = '0;


  ////////////////////////////
  // User Subordinate DEMUX //
  ////////////////////////////

  // ----------------------------------------------------------------------------------------------
  // User Subordinate Buses
  // ----------------------------------------------------------------------------------------------

  // collection of signals from the demultiplexer
  sbr_obi_req_t [NumDemuxSbr-1:0] all_user_sbr_obi_req;
  sbr_obi_rsp_t [NumDemuxSbr-1:0] all_user_sbr_obi_rsp;

  // Error Subordinate Bus
  sbr_obi_req_t user_error_obi_req;
  sbr_obi_rsp_t user_error_obi_rsp;

  // OBI bus to your design
  sbr_obi_req_t user_design_obi_req;
  sbr_obi_rsp_t user_design_obi_rsp;

  // Fanout into more readable signals
  assign user_error_obi_req               = all_user_sbr_obi_req[UserError];
  assign all_user_sbr_obi_rsp[UserError]  = user_error_obi_rsp;
  assign user_design_obi_req              = all_user_sbr_obi_req[UserDesign];
  assign all_user_sbr_obi_rsp[UserDesign] = user_design_obi_rsp;


  //-----------------------------------------------------------------------------------------------
  // Demultiplex to User Subordinates according to address map
  //-----------------------------------------------------------------------------------------------

  logic [cf_math_pkg::idx_width(NumDemuxSbr)-1:0] user_idx;

  addr_decode #(
    .NoIndices ( NumDemuxSbr                    ),
    .NoRules   ( $size(UserAddrMap)             ),
    .addr_t    ( logic[SbrObiCfg.DataWidth-1:0] ),
    .rule_t    ( addr_map_rule_t                ),
    .Napot     ( 1'b0                           )
  ) i_addr_decode_periphs (
    .addr_i           ( user_sbr_obi_req_i.a.addr ),
    .addr_map_i       ( UserAddrMap               ),
    .idx_o            ( user_idx                  ),
    .dec_valid_o      (),
    .dec_error_o      (),
    .en_default_idx_i ( 1'b1      ),
    .default_idx_i    ( UserError )
  );

  obi_demux #(
    .ObiCfg      ( SbrObiCfg     ),
    .obi_req_t   ( sbr_obi_req_t ),
    .obi_rsp_t   ( sbr_obi_rsp_t ),
    .NumMgrPorts ( NumDemuxSbr   ),
    .NumMaxTrans ( 2             )
  ) i_obi_demux (
    .clk_i,
    .rst_ni,

    .sbr_port_select_i ( user_idx             ),
    .sbr_port_req_i    ( user_sbr_obi_req_i   ),
    .sbr_port_rsp_o    ( user_sbr_obi_rsp_o   ),

    .mgr_ports_req_o   ( all_user_sbr_obi_req ),
    .mgr_ports_rsp_i   ( all_user_sbr_obi_rsp )
  );


//-------------------------------------------------------------------------------------------------
// User Subordinates
//-------------------------------------------------------------------------------------------------

  ///////////////////////////////////
  // Replace this with your Design //
  ///////////////////////////////////
  //obi_err_sbr #(
  // .ObiCfg      ( SbrObiCfg     ),
  // .obi_req_t   ( sbr_obi_req_t ),
  // .obi_rsp_t   ( sbr_obi_rsp_t ),
  // .NumMaxTrans ( 1             ),
  // .RspData     ( 32'hBADCAB1E  )
  // ) i_your_design_goes_here (
  //.clk_i,
  //.rst_ni,
  //.testmode_i ( testmode_i          ),
  //.obi_req_i  ( user_design_obi_req ),
  //.obi_rsp_o  ( user_design_obi_rsp )
  //);


  // This module bridges OBI based CROC Soc (manager) with AXI-lite based Wakelet (subordinate)
  // Wakelet is added into the user domain with addresses from 32'h2000_0000 to 32'h3000_0000
  // CROC's OBI manager port for instruction fetch is tied off to the bridge 
  // With Wakelet in the user domain, data from AON systems is designed to be handled by the Snitch core
  
  ///wl_axi_lite_req maps to axi_lite_slv_req_i
  wl_pkg::axi_lite_req_t  wl_axi_lite_req;
  ///wl_axi_lite_rsp maps to axi_lite_slv_rsp_o
  wl_pkg::axi_lite_resp_t wl_axi_lite_rsp;

  obi_to_axi #(
    /// The configuration of the OBI port (input port).
    .ObiCfg         ( croc_pkg::SbrObiCfg     ),
    /// The request struct of the OBI port
    .obi_req_t      ( croc_pkg::sbr_obi_req_t ),
    /// The response struct of the OBI port
    .obi_rsp_t      ( croc_pkg::sbr_obi_rsp_t ),
    /// Output is AXI lite when set to 1'b1
    .AxiLite        ( 1'b1 ),

    /// AXI Address Width
    .AxiAddrWidth   ( SbrObiCfg.AddrWidth ),
    /// AXI Data Width
    .AxiDataWidth   ( SbrObiCfg.DataWidth ),
    /// AXI User Width, manually assigned from the outside, applied to Ax
    /// kept as 1 to align with what wl_pkg in Wakelet expects
    .AxiUserWidth   ( 1 ),

    /// AXI Burst Type (burst unused but may be required for IP compatibility)
    .AxiBurstType   ( axi_pkg::BURST_INCR     ),
    /// The request struct of the AXI port
    .axi_req_t      ( wl_pkg::axi_lite_req_t  ), 
    /// The response struct of the AXI port
    .axi_rsp_t      ( wl_pkg::axi_lite_resp_t ),

    .MaxRequests    ( 2                       ) 
  )   i_OBI_Croc_AXILite_Wakelet (
    .clk_i ,
    .rst_ni,

    .obi_req_i  ( user_design_obi_req ),
    .obi_rsp_o  ( user_design_obi_rsp ),
    .user_i     ( 1'b0 ),
 
    .axi_req_o  ( wl_axi_lite_req    ),
    .axi_rsp_i  ( wl_axi_lite_rsp    ),

    // Signals for manual user reassignment of response
    // Left floating for wakelet
    .axi_rsp_channel_sel  (          ), // [ATOP , WE]
    .axi_rsp_b_user_o     (          ),
    .axi_rsp_r_user_o     (          ),
    .obi_rsp_user_i       ( '0       )// If unused tie to '0
  );

  /////////////////////////////////////
  /////Wakelet top level instance/////
  ////////////////////////////////////
   

  // add something to debug here 
  wl_top #(
     
     .BaseOffset( croc_pkg::UserBaseAddr )

    ) i_wakelet_user  (
    .clk_i,
    .rst_ni,

    // AXI Lite interface (slave port)
    .axi_lite_slv_req_i( wl_axi_lite_req ),
    .axi_lite_slv_rsp_o( wl_axi_lite_rsp ),

    // AXI Lite interface (master port)
    .axi_lite_mst_req_o (                ),
    .axi_lite_mst_rsp_i (       '0       ),

    // Wake-up request to core
    ///TO DO: Integrate interrupts and AXI slaves 
    .irq_i              (       '0        ),
    // End of computation and return value
    .eoc_o              (                 ),

    // AXI wide interface (slave port), for sensors
    .axi_wide_slv_req_i  (                ),
    .axi_wide_slv_rsp_o  (                )
  );



  // Error Subordinate
  // For unmapped addresses
  obi_err_sbr #(
    .ObiCfg      ( SbrObiCfg     ),
    .obi_req_t   ( sbr_obi_req_t ),
    .obi_rsp_t   ( sbr_obi_rsp_t ),
    .NumMaxTrans ( 1             ),
    .RspData     ( 32'hBADCAB1E  )
  ) i_user_err (
    .clk_i,
    .rst_ni,
    .testmode_i ( testmode_i         ),
    .obi_req_i  ( user_error_obi_req ),
    .obi_rsp_o  ( user_error_obi_rsp )
  );

endmodule

