`timescale 1ns / 1ps
module data_path #(
parameter PC_W = 8, // Program Counter
parameter INS_W = 32, // Instruction Width
parameter RF_ADDRESS = 5, // Register File Address
parameter DATA_W = 32, // Data WriteData
parameter DM_ADDRESS = 9, // Data Memory Address
parameter ALU_CC_W = 4 // ALU Control Code Width
)(
input clk ,
input reset ,
input reg_write ,
input mem2reg ,
input alu_src ,
input mem_write ,
input mem_read ,
input [ ALU_CC_W -1:0] alu_cc ,
output [6:0] opcode ,
output [6:0] funct7 ,
output [2:0] funct3 ,
output [ DATA_W -1:0] alu_result );
wire [PC_W -1:0] pc , pc_next ;
wire [INS_W -1:0] instruction ;
wire [ DATA_W -1:0] l_alu_result ;
wire [ DATA_W -1:0] reg1 , reg2 ;
wire [ DATA_W -1:0] l_read_data ;
wire [ DATA_W -1:0] l_reg_wr_data ;
wire [ DATA_W -1:0] srcb ;
wire [ DATA_W -1:0] extimm ;

assign pc_next = pc + 4;
FlipFlop pcreg (clk , reset , pc_next , pc );
// instruction memory
InstMem instruction_mem (pc , instruction );
assign opcode = instruction [6:0];
assign funct7 = instruction [31:25];
assign funct3 = instruction [14:12];
// register file
RegFile rf(
. clk ( clk ),
. reset ( reset ),
. rg_wrt_en ( reg_write ),
. rg_wrt_addr ( instruction [11:7] ),
. rg_rd_addr1 ( instruction [19:15] ),
. rg_rd_addr2 ( instruction [24:20] ),
. rg_wrt_data ( l_reg_wr_data ),
. rg_rd_data1 ( reg1 ),
. rg_rd_data2 ( reg2 ));
assign l_reg_wr_data = mem2reg ? l_read_data : l_alu_result ;
// sign extend
ImmGen ext_imm ( instruction , extimm );
// alu
assign srcb = alu_src ? extimm : reg2 ;
alu_32 alu_module (.A_in ( reg1 ),.B_in ( srcb ),.ALU_Sel ( alu_cc ),
.ALU_Out ( l_alu_result ),.Carry_Out (),.Zero (),.Overflow ());
assign alu_result = l_alu_result ;
// data memory
DataMem data_mem (.addr ( l_alu_result [ DM_ADDRESS -1:0]) ,.read_data ( l_read_data ),
.write_data ( reg2 ),.MemWrite ( mem_write ),.MemRead ( mem_read ) );
endmodule
