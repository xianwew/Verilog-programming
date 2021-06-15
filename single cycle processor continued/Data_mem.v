`timescale 1ns / 1ps
module DataMem ( MemRead , MemWrite , addr , write_data , read_data );
input [31:0]write_data;
input [8:0] addr;
input  MemWrite, MemRead;
output [31:0] read_data;
reg [31:0] memory [127:0];
always @(*) begin
if (MemWrite == 1)
memory[addr] = MemWrite;
end
assign read_data = (MemRead == 1)?memory[addr]:32'bx;
endmodule 