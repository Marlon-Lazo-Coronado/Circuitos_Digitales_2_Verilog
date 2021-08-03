/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "demux_32_8_synth.v:2" *)
module demux_32_8_synth(clk_f, clk_4f, reset_L, data_in, valid_0, valid_out_e, data_out_e);
  (* src = "demux_32_8_synth.v:33" *)
  wire [7:0] _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  (* src = "demux_32_8_synth.v:4" *)
  input clk_4f;
  (* src = "demux_32_8_synth.v:3" *)
  input clk_f;
  (* src = "demux_32_8_synth.v:7" *)
  input [31:0] data_in;
  (* src = "demux_32_8_synth.v:11" *)
  output [7:0] data_out_e;
  (* src = "demux_32_8_synth.v:5" *)
  input reset_L;
  (* src = "demux_32_8_synth.v:14" *)
  wire [3:0] selector;
  (* src = "demux_32_8_synth.v:9" *)
  output valid_0;
  (* src = "demux_32_8_synth.v:10" *)
  output valid_out_e;
  NAND _09_ (
    .A(data_in[1]),
    .B(reset_L),
    .Y(_01_)
  );
  NOT _10_ (
    .A(_01_),
    .Y(_00_[1])
  );
  NAND _11_ (
    .A(reset_L),
    .B(data_in[2]),
    .Y(_02_)
  );
  NOT _12_ (
    .A(_02_),
    .Y(_00_[2])
  );
  NAND _13_ (
    .A(reset_L),
    .B(data_in[3]),
    .Y(_03_)
  );
  NOT _14_ (
    .A(_03_),
    .Y(_00_[3])
  );
  NAND _15_ (
    .A(reset_L),
    .B(data_in[4]),
    .Y(_04_)
  );
  NOT _16_ (
    .A(_04_),
    .Y(_00_[4])
  );
  NAND _17_ (
    .A(reset_L),
    .B(data_in[5]),
    .Y(_05_)
  );
  NOT _18_ (
    .A(_05_),
    .Y(_00_[5])
  );
  NAND _19_ (
    .A(reset_L),
    .B(data_in[6]),
    .Y(_06_)
  );
  NOT _20_ (
    .A(_06_),
    .Y(_00_[6])
  );
  NAND _21_ (
    .A(reset_L),
    .B(data_in[7]),
    .Y(_07_)
  );
  NOT _22_ (
    .A(_07_),
    .Y(_00_[7])
  );
  NAND _23_ (
    .A(reset_L),
    .B(data_in[0]),
    .Y(_08_)
  );
  NOT _24_ (
    .A(_08_),
    .Y(_00_[0])
  );
  (* src = "demux_32_8_synth.v:33" *)
  DFF _25_ (
    .C(clk_4f),
    .D(_00_[0]),
    .Q(data_out_e[0])
  );
  (* src = "demux_32_8_synth.v:33" *)
  DFF _26_ (
    .C(clk_4f),
    .D(_00_[1]),
    .Q(data_out_e[1])
  );
  (* src = "demux_32_8_synth.v:33" *)
  DFF _27_ (
    .C(clk_4f),
    .D(_00_[2]),
    .Q(data_out_e[2])
  );
  (* src = "demux_32_8_synth.v:33" *)
  DFF _28_ (
    .C(clk_4f),
    .D(_00_[3]),
    .Q(data_out_e[3])
  );
  (* src = "demux_32_8_synth.v:33" *)
  DFF _29_ (
    .C(clk_4f),
    .D(_00_[4]),
    .Q(data_out_e[4])
  );
  (* src = "demux_32_8_synth.v:33" *)
  DFF _30_ (
    .C(clk_4f),
    .D(_00_[5]),
    .Q(data_out_e[5])
  );
  (* src = "demux_32_8_synth.v:33" *)
  DFF _31_ (
    .C(clk_4f),
    .D(_00_[6]),
    .Q(data_out_e[6])
  );
  (* src = "demux_32_8_synth.v:33" *)
  DFF _32_ (
    .C(clk_4f),
    .D(_00_[7]),
    .Q(data_out_e[7])
  );
  assign selector = 4'h3;
  assign valid_0 = 1'h1;
  assign valid_out_e = 1'h1;
endmodule