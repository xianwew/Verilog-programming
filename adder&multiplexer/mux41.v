`timescale 1ns / 1ps
module Mux41(
   S,
   D0,
   D1,
   D2,
   D3,
   Y);
input D0,D1,D2,D3;
input [1:0]S;
output Y;
assign Y = (D0&(~S[0])&(~S[1]))|(D1&(~S[1])&(S[0]))|(D2&(S[0])&(~S[1]))|(D3&(S[0])&(S[1]));
endmodule
