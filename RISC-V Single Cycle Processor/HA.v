`timescale 1ns / 1ps
module half_adder (A, Sum);
  input [7:0]A;
  output [7:0]Sum;

  assign Sum  = A + 4;  

endmodule 