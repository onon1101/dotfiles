module $__XILINX_BLOCKRAM_TDP_ (...);

parameter INIT = 0;
parameter OPTION_MODE = "FULL";

parameter PORT_A_RD_WIDTH = 1;
parameter PORT_A_WR_WIDTH = 1;
parameter PORT_A_WR_EN_WIDTH = 1;
parameter PORT_A_RD_USED = 1;
parameter PORT_A_WR_USED = 1;
parameter PORT_A_OPTION_WRITE_MODE = "NO_CHANGE";
parameter PORT_A_RD_INIT_VALUE = 0;
parameter PORT_A_RD_SRST_VALUE = 0;

parameter PORT_B_RD_WIDTH = 1;
parameter PORT_B_WR_WIDTH = 1;
parameter PORT_B_WR_EN_WIDTH = 1;
parameter PORT_B_RD_USED = 0;
parameter PORT_B_WR_USED = 0;
parameter PORT_B_OPTION_WRITE_MODE = "NO_CHANGE";
parameter PORT_B_RD_INIT_VALUE = 0;
parameter PORT_B_RD_SRST_VALUE = 0;

input PORT_A_CLK;
input PORT_A_CLK_EN;
input [15:0] PORT_A_ADDR;
input [PORT_A_WR_WIDTH-1:0] PORT_A_WR_DATA;
input [PORT_A_WR_EN_WIDTH-1:0] PORT_A_WR_EN;
output [PORT_A_RD_WIDTH-1:0] PORT_A_RD_DATA;
input PORT_A_RD_SRST;

input PORT_B_CLK;
input PORT_B_CLK_EN;
input [15:0] PORT_B_ADDR;
input [PORT_B_WR_WIDTH-1:0] PORT_B_WR_DATA;
input [PORT_B_WR_EN_WIDTH-1:0] PORT_B_WR_EN;
output [PORT_B_RD_WIDTH-1:0] PORT_B_RD_DATA;
input PORT_B_RD_SRST;

`include "brams_defs.vh"

`define PARAMS_COMMON \
	.WRITE_MODE_A(PORT_A_OPTION_WRITE_MODE), \
	.WRITE_MODE_B(PORT_B_OPTION_WRITE_MODE), \
	.READ_WIDTH_A(PORT_A_RD_USED ? PORT_A_RD_WIDTH : 0), \
	.READ_WIDTH_B(PORT_B_RD_USED ? PORT_B_RD_WIDTH : 0), \
	.WRITE_WIDTH_A(PORT_A_WR_USED ? PORT_A_WR_WIDTH : 0), \
	.WRITE_WIDTH_B(PORT_B_WR_USED ? PORT_B_WR_WIDTH : 0), \
	.DOA_REG(0), \
	.DOB_REG(0), \
	.INIT_A(ival(PORT_A_RD_WIDTH, PORT_A_RD_INIT_VALUE)), \
	.INIT_B(ival(PORT_B_RD_WIDTH, PORT_B_RD_INIT_VALUE)), \
	.SRVAL_A(ival(PORT_A_RD_WIDTH, PORT_A_RD_SRST_VALUE)), \
	.SRVAL_B(ival(PORT_B_RD_WIDTH, PORT_B_RD_SRST_VALUE)),

`MAKE_DI(DI_A, DIP_A, PORT_A_WR_DATA)
`MAKE_DI(DI_B, DIP_B, PORT_B_WR_DATA)
`MAKE_DO(DO_A, DOP_A, PORT_A_RD_DATA)
`MAKE_DO(DO_B, DOP_B, PORT_B_RD_DATA)

wire [3:0] WE_A = {4{PORT_A_WR_EN}};
wire [3:0] WE_B = {4{PORT_B_WR_EN}};

generate

if (OPTION_MODE == "HALF") begin
	RAMB18 #(
		`PARAMS_INIT_18
		`PARAMS_INITP_18
		`PARAMS_COMMON
	) _TECHMAP_REPLACE_ (
		.DOA(DO_A),
		.DOPA(DOP_A),
		.DIA(DI_A),
		.DIPA(DIP_A),
		.DOB(DO_B),
		.DOPB(DOP_B),
		.DIB(DI_B),
		.DIPB(DIP_B),
		.ADDRA(PORT_A_ADDR[13:0]),
		.ADDRB(PORT_B_ADDR[13:0]),
		.CLKA(PORT_A_CLK),
		.CLKB(PORT_B_CLK),
		.ENA(PORT_A_CLK_EN),
		.ENB(PORT_B_CLK_EN),
		.REGCEA(1'b0),
		.REGCEB(1'b0),
		.SSRA(PORT_A_RD_SRST),
		.SSRB(PORT_B_RD_SRST),
		.WEA(WE_A),
		.WEB(WE_B),
	);
end else if (OPTION_MODE == "FULL") begin
	RAMB36 #(
		`PARAMS_INIT_36
		`PARAMS_INITP_36
		`PARAMS_COMMON
		.RAM_EXTENSION_A("NONE"),
		.RAM_EXTENSION_B("NONE"),
	) _TECHMAP_REPLACE_ (
		.DOA(DO_A),
		.DOPA(DOP_A),
		.DIA(DI_A),
		.DIPA(DIP_A),
		.DOB(DO_B),
		.DOPB(DOP_B),
		.DIB(DI_B),
		.DIPB(DIP_B),
		.ADDRA({1'b1, PORT_A_ADDR[14:0]}),
		.ADDRB({1'b1, PORT_B_ADDR[14:0]}),
		.CLKA(PORT_A_CLK),
		.CLKB(PORT_B_CLK),
		.ENA(PORT_A_CLK_EN),
		.ENB(PORT_B_CLK_EN),
		.REGCEA(1'b0),
		.REGCEB(1'b0),
		.SSRA(PORT_A_RD_SRST),
		.SSRB(PORT_B_RD_SRST),
		.WEA(WE_A),
		.WEB(WE_B),
	);
end else begin
	wire CAS_A, CAS_B;
	RAMB36 #(
		`PARAMS_INIT_36
		`PARAMS_COMMON
		.RAM_EXTENSION_A("LOWER"),
		.RAM_EXTENSION_B("LOWER"),
	) lower (
		.DIA(DI_A),
		.DIB(DI_B),
		.ADDRA(PORT_A_ADDR),
		.ADDRB(PORT_B_ADDR),
		.CLKA(PORT_A_CLK),
		.CLKB(PORT_B_CLK),
		.ENA(PORT_A_CLK_EN),
		.ENB(PORT_B_CLK_EN),
		.REGCEA(1'b0),
		.REGCEB(1'b0),
		.SSRA(PORT_A_RD_SRST),
		.SSRB(PORT_B_RD_SRST),
		.WEA(WE_A),
		.WEB(WE_B),
		.CASCADEOUTLATA(CAS_A),
		.CASCADEOUTLATB(CAS_B),
	);
	RAMB36 #(
		`PARAMS_INIT_36_U
		`PARAMS_COMMON
		.RAM_EXTENSION_A("UPPER"),
		.RAM_EXTENSION_B("UPPER"),
	) upper (
		.DOA(DO_A),
		.DIA(DI_A),
		.DOB(DO_B),
		.DIB(DI_B),
		.ADDRA(PORT_A_ADDR),
		.ADDRB(PORT_B_ADDR),
		.CLKA(PORT_A_CLK),
		.CLKB(PORT_B_CLK),
		.ENA(PORT_A_CLK_EN),
		.ENB(PORT_B_CLK_EN),
		.REGCEA(1'b0),
		.REGCEB(1'b0),
		.SSRA(PORT_A_RD_SRST),
		.SSRB(PORT_B_RD_SRST),
		.WEA(WE_A),
		.WEB(WE_B),
		.CASCADEINLATA(CAS_A),
		.CASCADEINLATB(CAS_B),
	);
end

endgenerate

endmodule


module $__XILINX_BLOCKRAM_SDP_ (...);

parameter INIT = 0;
parameter OPTION_MODE = "FULL";
parameter OPTION_WRITE_MODE = "READ_FIRST";

parameter PORT_W_WIDTH = 1;
parameter PORT_W_WR_EN_WIDTH = 1;
parameter PORT_W_USED = 1;

parameter PORT_R_WIDTH = 1;
parameter PORT_R_USED = 0;
parameter PORT_R_RD_INIT_VALUE = 0;
parameter PORT_R_RD_SRST_VALUE = 0;

input PORT_W_CLK;
input PORT_W_CLK_EN;
input [15:0] PORT_W_ADDR;
input [PORT_W_WIDTH-1:0] PORT_W_WR_DATA;
input [PORT_W_WR_EN_WIDTH-1:0] PORT_W_WR_EN;

input PORT_R_CLK;
input PORT_R_CLK_EN;
input [15:0] PORT_R_ADDR;
output [PORT_R_WIDTH-1:0] PORT_R_RD_DATA;
input PORT_R_RD_SRST;

`include "brams_defs.vh"

`define PARAMS_COMMON \
	.DO_REG(0), \
	.INIT(ival(PORT_R_WIDTH, PORT_R_RD_INIT_VALUE)), \
	.SRVAL(ival(PORT_R_WIDTH, PORT_R_RD_SRST_VALUE)),

`define PORTS_COMMON \
	.DO(DO), \
	.DOP(DOP), \
	.DI(DI), \
	.DIP(DIP), \
	.WRCLK(PORT_W_CLK), \
	.RDCLK(PORT_R_CLK), \
	.WREN(PORT_W_CLK_EN), \
	.RDEN(PORT_R_CLK_EN), \
	.REGCE(1'b0), \
	.SSR(PORT_R_RD_SRST), \
	.WE(PORT_W_WR_EN),

`MAKE_DI(DI, DIP, PORT_W_WR_DATA)
`MAKE_DO(DO, DOP, PORT_R_RD_DATA)

generate

if (OPTION_MODE == "HALF") begin
	RAMB18SDP #(
		`PARAMS_INIT_18
		`PARAMS_INITP_18
		`PARAMS_COMMON
	) _TECHMAP_REPLACE_ (
		`PORTS_COMMON
		.WRADDR(PORT_W_ADDR[13:5]),
		.RDADDR(PORT_R_ADDR[13:5]),
	);
end else if (OPTION_MODE == "FULL") begin
	RAMB36SDP #(
		`PARAMS_INIT_36
		`PARAMS_INITP_36
		`PARAMS_COMMON
	) _TECHMAP_REPLACE_ (
		`PORTS_COMMON
		.WRADDR(PORT_W_ADDR[14:6]),
		.RDADDR(PORT_R_ADDR[14:6]),
	);
end

endgenerate

endmodule
