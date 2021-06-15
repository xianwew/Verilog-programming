`timescale 1ns / 1ps
module Mux1(
input [31:0]D0,D1,
input S1,
output  [31:0]Y1
    );
assign Y1 = (S1 == 0)? D0 : D1;
endmodule

module Mux2(
input [31:0]D3,D4,
input S2,
output  [31:0]Y2
    );
assign Y2 = (S2 == 0)? D4 : D3;
endmodule