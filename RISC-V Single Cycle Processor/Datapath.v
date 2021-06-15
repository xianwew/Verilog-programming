`timescale 1ns / 1ps
module data_path #(
parameter PC_W = 8, // Program Counter
parameter INS_W = 32, // Instruction Width
parameter RF_ADDRESS = 5, // Register File Address
 parameter DATA_W = 32, // Data WriteData
 parameter DM_ADDRESS = 9, // Data Memory Address
 parameter ALU_CC_W = 4 // ALU Control Code Width
)(
input clk , // CLK in Datapath figure
input reset , // Reset in Datapath figure
input reg_write , // RegWrite in Datapath figure
input mem2reg , // MemtoReg in Datapath figure
input alu_src , // ALUSrc in Datapath figure
input mem_write , // MemWrite in Datapath Figure
input mem_read , // MemRead in Datapath Figure
input [ ALU_CC_W -1:0] alu_cc , // ALUCC in Datapath Figure
output [6:0] opcode , // opcode in Datapath Figure
output [6:0] funct7 , // Funct7 in Datapath Figure
output [2:0] funct3 , // Func3 in Datapath Figure
output [ DATA_W -1:0] alu_result  );

wire [7:0] PCPlus4, Addr ;
wire [31:0] instruction, Reg1,Reg2,ExtImm,DataMem_read, WriteBack_Data, SrcB;
wire Carry_out, overflow,zero;

Mux1 connect5(Reg2, ExtImm,alu_src, SrcB);
Mux2 connect8(DataMem_read,alu_result,mem2reg,WriteBack_Data);

FlipFlop connect0(clk, reset, PCPlus4, Addr);
half_adder connect1(Addr,PCPlus4);

InstMem connect2(Addr,instruction);
assign opcode = instruction[6:0];
assign funct7 = instruction[31:25];
assign funct3 = instruction[14:12];

RegFile connect3(.reset(reset),.rg_wrt_en(reg_write),.rg_rd_addr1(instruction[19:15]),.rg_rd_addr2(instruction[24:20]),.rg_wrt_addr(instruction[11:7]),
.rg_rd_data1(Reg1),.rg_rd_data2(Reg2),.rg_wrt_data(WriteBack_Data));

ImmGen connect4(instruction[31:0],ExtImm);

alu_32 connect6(Reg1,SrcB,alu_cc,alu_result,Carry_out,zero,overflow);

DataMem connect7(mem_read,mem_write,alu_result[7:0],Reg2,DataMem_read);

endmodule