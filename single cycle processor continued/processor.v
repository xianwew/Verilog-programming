`timescale 1ns / 1ps
module processor(input clk , reset ,
output [31:0] Result);
wire [2:0]func3;
wire [6:0]func7;
wire [1:0]ALUOp;
wire [3:0]Operation;
wire [6:0]Opcode;
wire RegWrite,MenWrite,ALUSrc,MenRead,MemtoReg;
data_path connection1 (.clk(clk),.reset(reset),.alu_result(Result),.reg_write(RegWrite),.mem2reg(MemtoReg),.alu_src(ALUSrc),.mem_write(MenWrite),.mem_read(MenRead),.opcode(Opcode),
.funct7(func7),.funct3(func3),.alu_cc(Operation));

Controller connection2 (.Opcode(Opcode),.ALUSrc(ALUSrc),.MemtoReg(MemtoReg),.RegWrite(RegWrite),.MemRead(MenRead), 
.MemWrite(MenWrite),.ALUOp(ALUOp));

ALUController connection3(.ALUOp(ALUOp),.Funct7(func7),.Funct3(func3),.Operation(Operation));
endmodule
