
`timescale 1ns / 1ps
module FA(
input A,
input B,
input Cin,
output Sum,
output Cout
);
assign Sum = A ^ B ^ Cin;
assign Cout = A & B | Cin & ( A ^ B);
endmodule 
