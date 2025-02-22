"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.otherModes = exports.itemModes = exports.xilinx = void 0;
const xilinx = new Set([
    "IBUFDS_GTE2", "IBUFDS_GTE3", "OBUFDS_GTE3_ADV", "OBUFDS_GTE3",
    "XADC", "SYSMONE1",
    "DSP48E1", "DSP48E2",
    "BUFGCE_1", "BUFGCE", "BUFG", "BUFH", "BUFHCE", "BUFIO", "BUFMR", "BUFMRCE", "BUFR",
    "BUFGMUX_CTRL", "BUFGCTRL", "BUFGMUX", "BUFGMUX_1",
    "MMCME2_ADV", "PLLE2_ADV", "MMCME2_BASE", "PLLE2_BASE",
    "MMCME3_ADV", "PLLE3_ADV", "MMCME3_BASE", "PLLE3_BASE",
    "EFUSE_USR", "BSCANE2", "USR_ACCESSE2", "FRAME_ECCE2", "DNA_PORT", "DNA_PORT2", "ICAPE2", "CAPTUREE2", "STARTUPE2", "ICAPE3",
    "IOBUFDS", "IOBUFDS_INTERMDISABLE", "IOBUFDS_DIFF_OUT", "IOBUFDS_DIFF_OUT_INTERMDISABLE", "IOBUF", "IOBUF_INTERMDISABLE",
    "IDDR_2CLK", "IDDR", "ODDR", "DCIRESET", "IDDRE1", "ODDRE1",
    "IN_FIFO", "OUT_FIFO",
    "IBUFDS", "IBUFDS_IBUFDISABLE", "IBUFDS_DIFF_OUT", "IBUFDS_DIFF_OUT_IBUFDISABLE", "IBUFDS_DIFF_OUT_INTERMDISABLE", "IBUFDS_INTERMDISABLE", "IBUF", "IBUF_IBUFDISABLE", "IBUF_INTERMDISABLE", "BUFG_GT_SYNC",
    "IDELAYCTRL", "IDELAYE2",
    "ISERDESE2", "OSERDESE2",
    "OBUFDS", "OBUFTDS", "OBUF", "OBUFT",
    "KEEPER", "PULLDOWN", "PULLUP",
    "RAMB18E1", "RAMB36E1", "RAMB18E2", "RAMB36E2",
    "RAM32X1D_1", "RAM32X1D", "RAM64X1D", "RAM128X1D",
    "RAM32M", "RAM64M", "RAM32M16", "RAM64M8",
    "RAM32X1S_1", "RAM32X1S", "RAM32X2S",
    "RAM64X1S_1", "RAM64X1S", "RAM64X8SW",
    "RAM128X1S_1", "RAM128X1S",
    "RAM256X1S", "RAM512X1S",
    "ROM32X1", "ROM64X1", "ROM128X1", "ROM256X1",
    "FIFO18E1", "FIFO36E1", "FIFO18E2", "FIFO36E2",
    "IDDR_2CLK", "IDDR", "ODDR",
    "FDCE", "FDPE", "FDRE", "FDSE",
    "LDCE", "LDPE",
    "CARRY4", "CARRY8", "LUT6_2", "CFGLUT5",
    "AND2B1L", "OR2L",
    "LUT1", "LUT1_D", "LUT1_L",
    "LUT2", "LUT2_D", "LUT2_L",
    "LUT3", "LUT3_D", "LUT3_L",
    "LUT4", "LUT4_D", "LUT4_L",
    "LUT5", "LUT5_D", "LUT5_L",
    "LUT6", "LUT6_D", "LUT6_L",
    "MUXF7", "MUXF7_D", "MUXF7_L",
    "MUXF8", "MUXF8_D", "MUXF8_L",
    "MUXF9",
    "SRL16E", "SRLC32E",
    "MASTER_JTAG", "STARTUPE3", "HARD_SYNC"
]);
exports.xilinx = xilinx;
const itemModes = new Set([
    'vhdl', 'systemverilog', 'verilog', 'remote', 'cells'
]);
exports.itemModes = itemModes;
const otherModes = new Set([
    'src', 'sim', 'File Error', 'cells'
]);
exports.otherModes = otherModes;
//# sourceMappingURL=common.js.map