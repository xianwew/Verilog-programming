`timescale 1ns / 1ps
module Mux21(
input D0,D1,S,
output Y
    );
assign Y = S & D1 | ~ S & D0;
endmodule
