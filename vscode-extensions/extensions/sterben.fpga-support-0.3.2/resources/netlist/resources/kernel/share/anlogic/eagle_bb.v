// Anlogic Eagle - Blackbox cells
// FIXME: Create sim models

(* blackbox *)
module EG_LOGIC_BUF(
  output o,
  input i
);
endmodule

(* blackbox *)
module EG_LOGIC_BUFG(
  output o,
  input i
);
endmodule

(* blackbox *)
module EG_LOGIC_BUFIO(
  input clki,
  input rst,
  input coe,
  output clko,
  output clkdiv1,
  output clkdivx
);
  parameter GSR = "DISABLE";
  parameter DIV = 2;
  parameter STOPCLK = "DISABLE";
endmodule

(* blackbox *)
module EG_LOGIC_BUFGMUX(
  output o,
  input i0,
  input i1,
  input s
);
  parameter INIT_OUT = "0";
  parameter PRESELECT_I0 = "TRUE";
  parameter PRESELECT_I1 = "FALSE";
endmodule

(* blackbox *)
module EG_LOGIC_MBOOT(
  input rebootn,
  input [7:0] dynamic_addr  
);
  parameter ADDR_SOURCE_SEL = "STATIC";
  parameter STATIC_ADDR = 8'b00000000;
endmodule

(* blackbox *)
module EG_LOGIC_DNA(
  output dout,
  input  clk,
  input  din,
  input  shift_en
);
endmodule

(* blackbox *)
module EG_LOGIC_GCTRL(
  output done,
  output highz
);
endmodule

(* blackbox *)
module EG_LOGIC_GSRN(
  input gsrn,
  input sync_clk
);
  parameter GSRN_SYNC_SEL = "DISABLE";
  parameter USR_GSRN_EN = "DISABLE";
endmodule

(* blackbox *)
module EG_LOGIC_CCLK(
  output cclk,
  input  en
);
  parameter FREQ = "4.5";
endmodule

(* blackbox *)
module EG_LOGIC_IDELAY(
  output o,
  input i
);
  parameter INDEL = 0;
endmodule

(* blackbox *)
module EG_LOGIC_IDDR(
  output q1,
  output q0,
  input clk,
  input d,
  input rst
);
  parameter ASYNCRST = "ENABLE";
  parameter PIPEMODE = "PIPED";
endmodule

(* blackbox *)
module EG_LOGIC_ODDR(
  output q,
  input clk,
  input d1,
  input d0,
  input rst
);
  parameter ASYNCRST = "ENABLE";
endmodule

(* blackbox *)
module EG_LOGIC_IDDRx2(
  output q3,
  output q2,
  output q1,
  output q0,
  input pclk,
  input sclk,
  input d,
  input rst
);
  parameter ASYNCRST = "ENABLE";
endmodule

(* blackbox *)
module EG_LOGIC_ODELAY(
  output o,
  input i
);
  parameter OUTDEL = 0;
endmodule

(* blackbox *)
module EG_LOGIC_ODDRx2(
  output q,
  input pclk,
  input sclk,
  input d3,
  input d2,
  input d1,
  input d0,
  input rst
);
  parameter ASYNCRST = "ENABLE";
endmodule

(* blackbox *)
module EG_LOGIC_ODDRx2l(
  output q,
  input sclk,
  input d3,
  input d2,
  input d1,
  input d0,
  input rst
);
  parameter ASYNCRST = "ENABLE";
endmodule

(* blackbox *)
module EG_LOGIC_FIFO(
  input rst,
  input [DATA_WIDTH_W-1:0] di,
  output [DATA_WIDTH_R-1:0] do,
  input clkw,
  input we,
  input clkr,
  input re,
  input ore,
  input [2:0] csw,
  input [2:0] csr,
  output empty_flag,
  output aempty_flag,
  output full_flag,
  output afull_flag
);
  parameter DATA_WIDTH_W = 9;
  parameter DATA_WIDTH_R = DATA_WIDTH_W;
  parameter DATA_DEPTH_W = 1024;
  parameter DATA_DEPTH_R = DATA_WIDTH_W * DATA_DEPTH_W / DATA_WIDTH_R;
  parameter MODE = "FIFO8K";
  parameter REGMODE_W = "NOREG";
  parameter REGMODE_R = "NOREG";
  parameter E = 0;
  parameter AE = 6;
  parameter AF = DATA_DEPTH_W - 6;
  parameter F = DATA_DEPTH_W;
  parameter GSR = "DISABLE";
  parameter RESETMODE = "ASYNC";
  parameter ASYNC_RESET_RELEASE = "SYNC";
  parameter ENDIAN = "LITTLE";
endmodule

(* blackbox *)
module EG_LOGIC_DRAM(
  input [DATA_WIDTH_W-1:0] di,
  input [ADDR_WIDTH_W-1:0] waddr,
  input wclk,
  input we,
  output [DATA_WIDTH_R-1:0] do,
  input [ADDR_WIDTH_R-1:0] raddr
);
  parameter DATA_WIDTH_W = 9;
  parameter ADDR_WIDTH_W = 10;
  parameter DATA_DEPTH_W = 2 ** ADDR_WIDTH_W;
  parameter DATA_WIDTH_R = 9;
  parameter ADDR_WIDTH_R = 10;
  parameter DATA_DEPTH_R = 2 ** ADDR_WIDTH_R;
  parameter INIT_FILE = "NONE";
endmodule

(* blackbox *)
module EG_LOGIC_DRAM16X4(
  input [3:0] di,
  input [3:0] waddr,
  input wclk,
  input we,
  input [3:0]raddr,
  output [3:0]do
);
  parameter INIT_D0=16'h0000;
  parameter INIT_D1=16'h0000;
  parameter INIT_D2=16'h0000;
  parameter INIT_D3=16'h0000;
endmodule

(* blackbox *)
module EG_LOGIC_MULT(
  output [OUTPUT_WIDTH-1:0] p,
  input [INPUT_WIDTH_A-1:0] a,
  input [INPUT_WIDTH_B-1:0] b,
  input cea,
  input ceb,
  input cepd,
  input clk,
  input rstan,
  input rstbn,
  input rstpdn
); 
  parameter INPUT_WIDTH_A = 18;
  parameter INPUT_WIDTH_B = 18;
  parameter OUTPUT_WIDTH = 36;
  parameter INPUTFORMAT = "SIGNED";
  parameter INPUTREGA = "ENABLE";
  parameter INPUTREGB = "ENABLE";
  parameter OUTPUTREG = "ENABLE";
  parameter SRMODE = "ASYNC";
  parameter IMPLEMENT = "AUTO";
endmodule

(* blackbox *)
module EG_LOGIC_SEQ_DIV(
  input clk,
  input rst,
  input start,
  input [NUMER_WIDTH-1:0] numer,
  input [DENOM_WIDTH-1:0] denom,
  output [NUMER_WIDTH-1:0] quotient,
  output [DENOM_WIDTH-1:0] remain,
  output done
);
	parameter NUMER_WIDTH = 16;
  parameter DENOM_WIDTH = 16;
endmodule

(* blackbox *)
module EG_PHY_BRAM(
  output [8:0] doa,
  output [8:0] dob,
  input [8:0] dia,
  input [8:0] dib,
  input [2:0] csa,
  input [2:0] csb,
  input cea,
  input ocea,
  input clka,
  input wea,
  input rsta,
  input ceb,
  input oceb,
  input clkb,
  input web,
  input rstb,
  input [12:0] addra,
  input [12:0] addrb
);
  parameter MODE = "DP8K";
  parameter DATA_WIDTH_A = "9";
  parameter DATA_WIDTH_B = "9";
  parameter READBACK = "OFF";
  parameter REGMODE_A = "NOREG";
  parameter REGMODE_B = "NOREG";
  parameter WRITEMODE_A = "NORMAL";
  parameter WRITEMODE_B = "NORMAL";
  parameter GSR = "ENABLE";
  parameter RESETMODE = "SYNC";
  parameter ASYNC_RESET_RELEASE = "SYNC";
  parameter CEAMUX = "SIG";
  parameter CEBMUX = "SIG";
  parameter OCEAMUX = "SIG";
  parameter OCEBMUX = "SIG";
  parameter RSTAMUX = "SIG";
  parameter RSTBMUX = "SIG";
  parameter CLKAMUX = "SIG";
  parameter CLKBMUX = "SIG";
  parameter WEAMUX = "SIG";
  parameter WEBMUX = "SIG";
  parameter CSA0 = "SIG" ;
  parameter CSA1 = "SIG" ;
  parameter CSA2 = "SIG" ;
  parameter CSB0 = "SIG" ;
  parameter CSB1 = "SIG" ;
  parameter CSB2 = "SIG" ;
  parameter INIT_FILE = "NONE";
  parameter INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
endmodule

(* blackbox *)
module EG_PHY_BRAM32K(
  output [15:0] doa,
  output [15:0] dob,
  input [15:0] dia,
  input [15:0] dib,
  input [10:0] addra,
  input [10:0] addrb,
  input bytea,
  input bytewea,
  input byteb,
  input byteweb,
  input csa,
  input wea,
  input csb,
  input web,
  input clka,
  input rsta,
  input clkb,
  input rstb,
  input ocea,
  input oceb
);
  parameter MODE = "DP16K";
  parameter DATA_WIDTH_A = "16";
  parameter DATA_WIDTH_B = "16";
  parameter REGMODE_A = "NOREG";
  parameter REGMODE_B = "NOREG";
  parameter WRITEMODE_A = "NORMAL";
  parameter WRITEMODE_B = "NORMAL";
  parameter SRMODE = "SYNC";
  parameter CSAMUX = "SIG";
  parameter CSBMUX = "SIG";
  parameter OCEAMUX = "SIG";
  parameter OCEBMUX = "SIG";
  parameter RSTAMUX = "SIG";
  parameter RSTBMUX = "SIG";
  parameter CLKAMUX = "SIG";
  parameter CLKBMUX = "SIG";
  parameter WEAMUX = "SIG";
  parameter WEBMUX = "SIG";
  parameter READBACK = "OFF";
  parameter INIT_FILE = "";
  parameter INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_40 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_41 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_42 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_43 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_44 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_45 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_46 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_47 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_48 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_49 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_4A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_4B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_4C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_4D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_4E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_4F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_50 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_51 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_52 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_53 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_54 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_55 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_56 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_57 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_58 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_59 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_5A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_5B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_5C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_5D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_5E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_5F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_60 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_61 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_62 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_63 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_64 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_65 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_66 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_67 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_68 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_69 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_6A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_6B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_6C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_6D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_6E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_6F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_70 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_71 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_72 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_73 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_74 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_75 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_76 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_77 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_78 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_79 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_7A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_7B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_7C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_7D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_7E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
  parameter INIT_7F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
endmodule

(* blackbox *)
module EG_PHY_FIFO(
  input [8:0] dia,
  input [8:0] dib,
  input [2:0] csr,
  input [2:0] csw,
  input we,
  input re,
  input clkw,
  input clkr,
  input rst,
  input rprst,
  input orea,
  input oreb,
  output [8:0] dob,
  output [8:0] doa,
  output empty_flag,
  output aempty_flag,
  output afull_flag,
  output full_flag
);
  parameter MODE = "FIFO8K";
  parameter DATA_WIDTH_A = "18";
  parameter DATA_WIDTH_B = "18";
  parameter READBACK = "OFF";
  parameter REGMODE_A = "NOREG";
  parameter REGMODE_B = "NOREG";
  parameter [13:0] AE = 14'b00000001100000;
  parameter [13:0] AF = 14'b01111110010000;
  parameter [13:0] F = 14'b01111111110000;
  parameter [13:0] AEP1 = 14'b00000001110000;
  parameter [13:0] AFM1 = 14'b01111110000000;
  parameter [13:0] FM1  = 14'b01111111100000;   
  parameter [4:0] E = 5'b00000;
  parameter [5:0] EP1 = 6'b010000;
  parameter GSR = "ENABLE";
  parameter RESETMODE = "ASYNC";
  parameter ASYNC_RESET_RELEASE = "SYNC";
  parameter CEA = "SIG";
  parameter CEB = "SIG";
  parameter OCEA = "SIG";
  parameter OCEB = "SIG";
  parameter RSTA = "SIG";
  parameter RSTB = "SIG";
  parameter CLKA = "SIG";
  parameter CLKB = "SIG";
  parameter WEA = "SIG";
  parameter WEB = "SIG";
  parameter CSA0 = "SIG";
  parameter CSA1 = "SIG";
  parameter CSA2 = "SIG";
  parameter CSB0 = "SIG";
  parameter CSB1 = "SIG";
  parameter CSB2 = "SIG";
endmodule

(* blackbox *)
module EG_PHY_MULT18(
  output [17:0] acout,
  output [17:0] bcout,
  output [35:0] p,
  input signeda,
  input signedb,
  input [17:0] a,
  input [17:0] b,
  input [17:0] acin,
  input [17:0] bcin,
  input cea,
  input ceb,
  input cepd,
  input clk,
  input rstan,
  input rstbn,
  input rstpdn,
  input sourcea,
  input sourceb  
); 
  parameter INPUTREGA = "ENABLE";
  parameter INPUTREGB = "ENABLE";
  parameter OUTPUTREG = "ENABLE";
  parameter SRMODE = "ASYNC";
  parameter MODE = "MULT18X18C";
  parameter CEAMUX = "SIG";
  parameter CEBMUX = "SIG";
  parameter CEPDMUX = "SIG";
  parameter RSTANMUX = "SIG";
  parameter RSTBNMUX = "SIG";
  parameter RSTPDNMUX = "SIG";
  parameter CLKMUX = "SIG";
  parameter SIGNEDAMUX = "SIG";
  parameter SIGNEDBMUX = "SIG";
  parameter SOURCEAMUX = "SIG";
  parameter SOURCEBMUX = "SIG";
endmodule

(* blackbox *)
module EG_PHY_GCLK(
  input clki,
  output clko
);    
endmodule

(* blackbox *)
module EG_PHY_IOCLK(
  input clki,
  input stop,
  output clko
);
  parameter STOPCLK = "DISABLE";
endmodule

(* blackbox *)
module EG_PHY_CLKDIV(
  output clkdiv1,
  output clkdivx,
  input clki,
  input rst,
  input rls
);    
  parameter GSR = "DISABLE";
  parameter DIV = 2;
endmodule

(* blackbox *)
module EG_PHY_CONFIG(
  output jrstn,
  output [1:0] jrti,
  output jshift,
  output jtck,
  output jtdi,
  output jupdate,
  output [1:0] jscanen,
  output jtms,
  input [1:0] jtdo,
  input [7:0] jtag8_ipa,
  input [7:0] jtag8_ipb,
  output done,
  output highz,
  output cclk,
  input	cclk_en,
  input gsrn_sync_clk,
  input usr_gsrn,
  output dna_dout,
  input	dna_clk,
  input	dna_din,
  input	dna_shift_en,
  input	mboot_rebootn,
  input [7:0]	mboot_dynamic_addr
);  
  parameter MBOOT_AUTO_SEL = "DISABLE";
  parameter ADDR_SOURCE_SEL = "STATIC";
  parameter STATIC_ADDR = 8'b0;
  parameter DONE_PERSISTN = "ENABLE";
  parameter INIT_PERSISTN = "ENABLE";
  parameter PROGRAMN_PERSISTN = "DISABLE";
  parameter JTAG_PERSISTN = "DISABLE";
  parameter GSRN_SYNC_SEL = "DISABLE";
  parameter FREQ = "2.5";
  parameter USR_GSRN_EN = "DISABLE";
endmodule

(* blackbox *)
module EG_PHY_OSC(
  input osc_dis,
  output osc_clk
);    
  parameter STDBY = "DISABLE";
endmodule

(* blackbox *)
module EG_PHY_PWRMNT(
    output pwr_dwn_n,
    input sel_pwr,
    input pwr_mnt_pd
);
  parameter MNT_LVL = 0;
endmodule

(* blackbox *)
module EG_PHY_DDR_8M_16(
  input clk,
  input clk_n,
  input ras_n,
  input cas_n,
  input we_n,
  input cs_n,
  input [11:0] addr,
  input [1:0] ba,
  inout [15:0] dq,
  input ldqs,
  input udqs,
  input ldm,
  input udm,
  input cke
);
endmodule

(* blackbox *)
module EG_PHY_SDRAM_2M_32(
  input clk,
  input ras_n,
  input cas_n,
  input we_n,
  input [10:0] addr,
  input [1:0] ba,
  inout [31:0] dq,
  input cs_n,
  input dm0,
  input dm1,
  input dm2,
  input dm3,
  input cke
);
endmodule

(* blackbox *)
module EG_PHY_PAD(
  input ipad,
  output opad,
  inout bpad,
  input rst,
  input ce,
  input isclk,
  input ipclk,
  input osclk,
  input opclk,
  input ts,
  input [3:0] do,
  output di,
  output [3:0] diq
);
  parameter DEDCLK = "DISABLE";
  parameter GSR = "ENABLE";
  parameter SRMODE = "SYNC";
  parameter TSMUX = "1";
  parameter INSCLKMUX = "0";
  parameter INPCLKMUX = "CLK";
  parameter INCEMUX = "CE";
  parameter INRSTMUX = "0";
  parameter IN_REGSET = "RESET";
  parameter IN_DFFMODE = "NONE";
  parameter IDDRMODE = "OFF";
  parameter IDDRPIPEMODE = "NONE";
  parameter INDELMUX = "NODEL";
  parameter INDEL = 0;
  parameter OUTSCLKMUX = "0";
  parameter OUTPCLKMUX = "CLK";
  parameter OUTCEMUX = "CE";
  parameter OUTRSTMUX = "0";
  parameter DO_REGSET = "RESET";
  parameter DO_DFFMODE = "NONE";
  parameter ODDRMODE = "OFF";
  parameter OUTDELMUX = "NODEL";
  parameter OUTDEL = 0;
  parameter TO_REGSET = "RESET";
  parameter TO_DFFMODE = "NONE";
  parameter MODE = "IN";
  parameter DRIVE = "NONE";
  parameter IOTYPE = "LVCMOS25";
endmodule

(* blackbox *)
module EG_PHY_MSLICE(
  input [1:0] a,
  input [1:0] b,
  input [1:0] c,
  input [1:0] d,
  input [1:0] mi,
  input clk,
  input ce,
  input sr,
  input fci,
  output [1:0] f,
  output [1:0] fx,
  output [1:0] q,
  output fco,
  input dpram_mode,
  input [1:0] dpram_di,
  input dpram_we,
  input dpram_wclk,
  input [3:0] dpram_waddr
);
  parameter INIT_LUT0 = 16'h0000;
  parameter INIT_LUT1 = 16'h0000;
  parameter MODE = "LOGIC";
  parameter ALUTYPE = "ADD";
  parameter MSFXMUX = "OFF";
  parameter GSR = "ENABLE";
  parameter TESTMODE = "OFF";
  parameter CEMUX = "CE";
  parameter SRMUX = "SR";
  parameter CLKMUX = "CLK";
  parameter SRMODE = "ASYNC";
  parameter DFFMODE = "FF";
  parameter REG0_SD = "MI";
  parameter REG1_SD = "MI";
  parameter REG0_REGSET = "SET";
  parameter REG1_REGSET = "SET";
endmodule

(* blackbox *)
module EG_PHY_LSLICE(
  input [1:0] a,
  input [1:0] b,
  input [1:0] c,
  input [1:0] d,
  input [1:0] e,
  input [1:0] mi,
  input clk,
  input ce,
  input sr,
  input fci,
  output [1:0] f,
  output [1:0] fx,
  output [1:0] q,
  output fco,
  output [3:0] dpram_di,
  output [3:0] dpram_waddr,
  output dpram_wclk,
  output dpram_we,
  output dpram_mode
);
  parameter INIT_LUTF0 = 16'h0000;
  parameter INIT_LUTG0 = 16'h0000;
  parameter INIT_LUTF1 = 16'h0000;
  parameter INIT_LUTG1 = 16'h0000;
  parameter MODE = "LOGIC";
  parameter GSR = "ENABLE";
  parameter TESTMODE = "OFF";
  parameter CEMUX = "1";
  parameter SRMUX = "SR";
  parameter CLKMUX = "CLK";
  parameter SRMODE = "ASYNC";
  parameter DFFMODE = "FF";
  parameter REG0_SD = "MI";
  parameter REG1_SD = "MI";
  parameter REG0_REGSET = "SET";
  parameter REG1_REGSET = "SET";
  parameter DEMUX0 = "D";
  parameter DEMUX1 = "D";
  parameter CMIMUX0 = "C";
  parameter CMIMUX1 = "C";
  parameter LSFMUX0 = "LUTF";
  parameter LSFXMUX0 = "LUTG";
  parameter LSFMUX1 = "LUTF";
  parameter LSFXMUX1 = "LUTG";
endmodule

(* blackbox *)
module EG_PHY_PLL(
  output [4:0] clkc,
  output extlock,
  input stdby,
  input refclk,
  input fbclk,
  input reset,
  output psdone,
  input psclk,
  input psdown,
  input psstep,
  input [2:0] psclksel,
  output [7:0] do,
  input dclk,
  input dcs,
  input dwe,
  input [7:0] di,
  input [5:0] daddr
);
  parameter DYNCFG = "DISABLE";
  parameter IF_ESCLKSTSW = "DISABLE";
  parameter REFCLK_SEL = "INTERNAL";
  parameter FIN = "100.0000";
  parameter REFCLK_DIV = 1;
  parameter FBCLK_DIV = 1;
  parameter CLKC0_DIV = 1;
  parameter CLKC1_DIV = 1;
  parameter CLKC2_DIV = 1;
  parameter CLKC3_DIV = 1;
  parameter CLKC4_DIV = 1;
  parameter CLKC0_ENABLE = "DISABLE";
  parameter CLKC1_ENABLE = "DISABLE";
  parameter CLKC2_ENABLE = "DISABLE";
  parameter CLKC3_ENABLE = "DISABLE";
  parameter CLKC4_ENABLE = "DISABLE";
  parameter CLKC0_DIV2_ENABLE = "DISABLE";
  parameter CLKC1_DIV2_ENABLE = "DISABLE";
  parameter CLKC2_DIV2_ENABLE = "DISABLE";
  parameter CLKC3_DIV2_ENABLE = "DISABLE";
  parameter CLKC4_DIV2_ENABLE = "DISABLE";
  parameter FEEDBK_MODE = "NORMAL";
  parameter FEEDBK_PATH = "VCO_PHASE_0";  
  parameter STDBY_ENABLE = "ENABLE";
  parameter CLKC0_FPHASE = 0;
  parameter CLKC1_FPHASE = 0;
  parameter CLKC2_FPHASE = 0;
  parameter CLKC3_FPHASE = 0;
  parameter CLKC4_FPHASE = 0;
  parameter CLKC0_CPHASE = 1;
  parameter CLKC1_CPHASE = 1;
  parameter CLKC2_CPHASE = 1;
  parameter CLKC3_CPHASE = 1;
  parameter CLKC4_CPHASE = 1;
  parameter GMC_GAIN = 7;
  parameter GMC_TEST = 14;
  parameter ICP_CURRENT = 14;
  parameter KVCO = 7;
  parameter LPF_CAPACITOR = 3;
  parameter LPF_RESISTOR = 1;
  parameter PLLRST_ENA = "ENABLE";
  parameter PLLMRST_ENA = "DISABLE";
  parameter PLLC2RST_ENA = "DISABLE";
  parameter PLLC34RST_ENA = "DISABLE";
  parameter PREDIV_MUXC0 = "VCO";
  parameter PREDIV_MUXC1 = "VCO";
  parameter PREDIV_MUXC2 = "VCO";
  parameter PREDIV_MUXC3 = "VCO";
  parameter PREDIV_MUXC4 = "VCO";
  parameter ODIV_MUXC0 = "DIV";
  parameter ODIV_MUXC1 = "DIV";
  parameter ODIV_MUXC2 = "DIV";
  parameter ODIV_MUXC3 = "DIV";
  parameter ODIV_MUXC4 = "DIV";
  parameter FREQ_LOCK_ACCURACY = 2;
  parameter PLL_LOCK_MODE = 0;
  parameter INTFB_WAKE = "DISABLE";
  parameter DPHASE_SOURCE = "DISABLE";
  parameter VCO_NORESET = "DISABLE";
  parameter STDBY_VCO_ENA = "DISABLE";
  parameter NORESET = "DISABLE";
  parameter SYNC_ENABLE = "ENABLE";
  parameter DERIVE_PLL_CLOCKS = "DISABLE";
  parameter GEN_BASIC_CLOCK = "DISABLE";
endmodule

(* blackbox *)
module EG_LOGIC_BRAM(
  output [DATA_WIDTH_A-1:0] doa,
  output [DATA_WIDTH_B-1:0] dob,
  input [DATA_WIDTH_A-1:0] dia,
  input [DATA_WIDTH_B-1:0] dib,
  input cea,
  input ocea,
  input clka,
  input wea,
  input rsta,
  input ceb,
  input oceb,
  input clkb,
  input web,
  input rstb,
  input [BYTE_A - 1 : 0] bea,
  input [BYTE_B - 1 : 0] beb,
  input [ADDR_WIDTH_A-1:0] addra,
  input [ADDR_WIDTH_B-1:0] addrb
);
  parameter DATA_WIDTH_A = 9;
  parameter DATA_WIDTH_B = DATA_WIDTH_A;
  parameter ADDR_WIDTH_A = 10;
  parameter ADDR_WIDTH_B = ADDR_WIDTH_A;
  parameter DATA_DEPTH_A = 2 ** ADDR_WIDTH_A;
  parameter DATA_DEPTH_B = 2 ** ADDR_WIDTH_B;
  parameter BYTE_ENABLE = 0;
  parameter BYTE_A = BYTE_ENABLE == 0 ? 1 : DATA_WIDTH_A / BYTE_ENABLE;
  parameter BYTE_B = BYTE_ENABLE == 0 ? 1 : DATA_WIDTH_B / BYTE_ENABLE;  
  parameter MODE = "DP";
  parameter REGMODE_A = "NOREG";
  parameter REGMODE_B = "NOREG";
  parameter WRITEMODE_A = "NORMAL";
  parameter WRITEMODE_B = "NORMAL";
  parameter RESETMODE = "SYNC";
  parameter DEBUGGABLE = "NO";
  parameter PACKABLE = "NO";
  parameter FORCE_KEEP = "OFF";
  parameter INIT_FILE = "NONE";
  parameter FILL_ALL = "NONE";
  parameter IMPLEMENT = "9K";
endmodule     

(* blackbox *)
module EG_PHY_ADC(
  input clk,
  input pd,
  input [2:0] s,
  input soc,
  output eoc,
  output [11:0] dout
);
  parameter CH0 = "DISABLE";
  parameter CH1 = "DISABLE";
  parameter CH2 = "DISABLE";
  parameter CH3 = "DISABLE";
  parameter CH4 = "DISABLE";
  parameter CH5 = "DISABLE";
  parameter CH6 = "DISABLE";
  parameter CH7 = "DISABLE";
  parameter VREF = "DISABLE";
endmodule
