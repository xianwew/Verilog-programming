`timescale 1ns / 1ps
module Controller(Opcode ,
ALUSrc , MemtoReg , RegWrite , MemRead , MemWrite ,
ALUOp);

input [6:0]Opcode;
output reg ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite;
output reg [1:0]ALUOp;

always @ (*)begin
if (Opcode==7'b0110011)begin
ALUSrc=1'b0;
MemtoReg=1'b0;
MemWrite=1'b0;
MemRead=1'b0;
RegWrite=1'b1;
ALUOp=2'b10;
end
else if(Opcode==7'b0010011)begin
ALUSrc=1'b1;
MemtoReg=1'b0;
MemWrite=1'b0;
MemRead=1'b0;
RegWrite=1'b1;
ALUOp=2'b00;
end
else if(Opcode==7'b0000011)begin
ALUSrc=1'b1;
MemtoReg=1'b1;
MemWrite=1'b0;
MemRead=1'b1;
RegWrite=1'b1;
ALUOp=2'b01;
end
else if(Opcode==7'b0100011)begin
ALUSrc=1'b1;
MemtoReg=1'b0;
MemWrite=1'b0;
MemRead=1'b0;
RegWrite=1'b1;
ALUOp=2'b01;
end
end
endmodule
