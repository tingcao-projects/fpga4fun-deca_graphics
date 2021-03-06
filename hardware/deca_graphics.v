
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module deca_graphics(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [7:0]		LED,

	//////////// CapSense Button //////////
	inout 		          		CAP_SENSE_I2C_SCL,
	inout 		          		CAP_SENSE_I2C_SDA,

	//////////// SDRAM //////////
	output		    [14:0]		DDR3_A,
	output		     [2:0]		DDR3_BA,
	output		          		DDR3_CAS_n,
	inout 		          		DDR3_CK_n,
	inout 		          		DDR3_CK_p,
	output		          		DDR3_CKE,
	input 		          		DDR3_CLK_50,
	output		          		DDR3_CS_n,
	output		     [1:0]		DDR3_DM,
	inout 		    [15:0]		DDR3_DQ,
	inout 		     [1:0]		DDR3_DQS_n,
	inout 		     [1:0]		DDR3_DQS_p,
	output		          		DDR3_ODT,
	output		          		DDR3_RAS_n,
	output		          		DDR3_RESET_n,
	output		          		DDR3_WE_n,

	//////////// HDMI-TX //////////
	inout 		          		HDMI_I2C_SCL,
	inout 		          		HDMI_I2C_SDA,
	inout 		     [3:0]		HDMI_I2S,
	inout 		          		HDMI_LRCLK,
	inout 		          		HDMI_MCLK,
	inout 		          		HDMI_SCLK,
	output		          		HDMI_TX_CLK,
	output		    [23:0]		HDMI_TX_D,
	output		          		HDMI_TX_DE,
	output		          		HDMI_TX_HS,
	input 		          		HDMI_TX_INT,
	output		          		HDMI_TX_VS,

/*
	//////////// MIPI //////////
	output		          		MIPI_CORE_EN,
	output		          		MIPI_I2C_SCL,
	inout 		          		MIPI_I2C_SDA,
	input 		          		MIPI_LP_MC_n,
	input 		          		MIPI_LP_MC_p,
	input 		     [3:0]		MIPI_LP_MD_n,
	input 		     [3:0]		MIPI_LP_MD_p,
	input 		          		MIPI_MC_p,
	output		          		MIPI_MCLK,
	input 		     [3:0]		MIPI_MD_p,
	output		          		MIPI_RESET_n,
	output		          		MIPI_WP,
*/
	//////////// Ethernet //////////
	input 		          		NET_COL,
	input 		          		NET_CRS,
	output		          		NET_MDC,
	inout 		          		NET_MDIO,
	output		          		NET_PCF_EN,
	output		          		NET_RESET_n,
	input 		          		NET_RX_CLK,
	input 		          		NET_RX_DV,
	input 		          		NET_RX_ER,
	input 		     [3:0]		NET_RXD,
	input 		          		NET_TX_CLK,
	output		          		NET_TX_EN,
	output		     [3:0]		NET_TXD,

	//////////// MicroSD Card //////////
	output		          		SD_CLK,
	inout 		          		SD_CMD,
	output		          		SD_CMD_DIR,
	output		          		SD_D0_DIR,
	inout 		          		SD_D123_DIR,
	inout 		     [3:0]		SD_DAT,
	input 		          		SD_FB_CLK,
	output		          		SD_SEL,

	//////////// SW //////////
	input 		     [1:0]		SW,

	//////////// USB //////////
	input 		          		USB_CLKIN,
	output		          		USB_CS,
	inout 		     [7:0]		USB_DATA,
	input 		          		USB_DIR,
	input 		          		USB_FAULT_n,
	input 		          		USB_NXT,
	output		          		USB_RESET_n,
	output		          		USB_STP
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

wire reset_n;
wire [7:0] nios_led;


wire ddr3_pll_locked;
wire ddr3_local_init_done;
wire ddr3_local_cal_success;
wire ddr3_local_cal_fail;

wire vip_clk;
wire raw_sop;
wire raw_eop;
wire raw_valid;
wire raw_ready;
wire [7:0] raw_data;

wire find_good_frame;
wire stream_reset_n;


//=======================================================
//  Structural coding
//=======================================================

assign reset_n = 1'b1;
/*
assign stream_reset_n = KEY[0];
assign MIPI_CORE_EN = KEY[0];
assign MIPI_RESET_n = KEY[0];
assign MIPI_WP = 1'b0;
*/

deca_vip u0 (
.clk_clk                                      (MAX10_CLK1_50),
.reset_reset_n                                (reset_n),
.altpll_sys_hdmi_clk                          (HDMI_TX_CLK),
.altpll_mipi_clk_clk                          (MIPI_MCLK),

/*
.terasic_bayer2rgb_din_data                    (raw_data),
.terasic_bayer2rgb_din_endofpacket             (raw_eop),
.terasic_bayer2rgb_din_ready                   (raw_ready),
.terasic_bayer2rgb_din_startofpacket           (raw_sop),
.terasic_bayer2rgb_din_valid                   (raw_valid),
*/

// Camera Video In
.clock_bridge_vip_out_clk_clk                (vip_clk),


// HDMI output
.hdmi_cvo_vid_clk                               (HDMI_TX_CLK),
.hdmi_cvo_vid_data                              (HDMI_TX_D),
.hdmi_cvo_underflow                             (),
.hdmi_cvo_vid_datavalid                         (HDMI_TX_DE),
.hdmi_cvo_vid_v_sync                            (HDMI_TX_VS),
.hdmi_cvo_vid_h_sync                            (HDMI_TX_HS),
.hdmi_cvo_vid_f                                 (),
.hdmi_cvo_vid_h                                 (),
.hdmi_cvo_vid_v                                 (),

/*
.i2c_opencores_mipi_export_scl_pad_io         (MIPI_I2C_SCL),
.i2c_opencores_mipi_export_sda_pad_io         (MIPI_I2C_SDA),
.mipi_reset_n_external_connection_export      (),
.mipi_core_en_external_connection_export      (),
*/

.led_external_connection_export               (nios_led),
.sw_external_connection_export                (SW),

//////////////////////////////////
// DDR3
.memory_mem_a                     (DDR3_A),
.memory_mem_ba                    (DDR3_BA),
.memory_mem_ck                    (DDR3_CK_p),
.memory_mem_ck_n                  (DDR3_CK_n),
.memory_mem_cke                   (DDR3_CKE),
.memory_mem_cs_n                  (DDR3_CS_n),
.memory_mem_dm                    (DDR3_DM),
.memory_mem_ras_n                 (DDR3_RAS_n),
.memory_mem_cas_n                 (DDR3_CAS_n),
.memory_mem_we_n                  (DDR3_WE_n),
.memory_mem_reset_n               (DDR3_RESET_n),
.memory_mem_dq                    (DDR3_DQ),
.memory_mem_dqs                   (DDR3_DQS_p),
.memory_mem_dqs_n                 (DDR3_DQS_n),
.memory_mem_odt                   (DDR3_ODT),
.mem_if_ddr3_emif_pll_ref_clk_clk (DDR3_CLK_50),

.mem_if_ddr3_emif_pll_sharing_pll_locked       (ddr3_pll_locked),
.mem_if_ddr3_emif_status_local_init_done       (ddr3_local_init_done),
.mem_if_ddr3_emif_status_local_cal_success     (ddr3_local_cal_success),
.mem_if_ddr3_emif_status_local_cal_fail        (ddr3_local_cal_fail),

.ddr3_status_external_connection_export        ({ddr3_pll_locked, ddr3_local_cal_success, ddr3_local_cal_fail, ddr3_local_init_done })
);

assign LED[7] = ~find_good_frame;
assign LED[6] = stream_reset_n;


defparam heart_beat_pkg_clk.DUR_BITS = 29;
heart_beat heart_beat_pkg_clk(
.clk(pkg_clk), // 105 MHz
.led(LED[0])
);


defparam heart_beat_pkg_clk.DUR_BITS = 10;
heart_beat heart_beat_pixel_frame_valid(
.clk(pixel_frame_valid),
.led(LED[1])
);

defparam heart_beat_pkg_clk.DUR_BITS = 14;
heart_beat heart_beat_pixel_valid(
.clk(pixel_valid),
.led(LED[2])
);

//////////////////////////////////////////
// HDMI Config

//HDMI I2C
I2C_HDMI_Config u2 (
.iCLK(MAX10_CLK2_50),
.iRST_N(reset_n),
.I2C_SCLK(HDMI_I2C_SCL),
.I2C_SDAT(HDMI_I2C_SDA),
.HDMI_TX_INT(HDMI_TX_INT)
);


endmodule
