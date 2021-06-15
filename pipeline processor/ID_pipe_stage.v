`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2020 10:37:51 AM
// Design Name: 
// Module Name: ID_pipe_stage
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ID_pipe_stage(
    input  clk, reset,
    input  [9:0] pc_plus4,
    input  [31:0] instr,
    input  mem_wb_reg_write,
    input  [4:0] mem_wb_write_reg_addr,
    input  [31:0] mem_wb_write_back_data,
    input  Data_Hazard,
    input  Control_Hazard,
    output [31:0] reg1, reg2,
    output [31:0] imm_value,
    output [9:0] branch_address,
    output [9:0] jump_address,
    output branch_taken,
    output [4:0] destination_reg, 
    output mem_to_reg,
    output [1:0] alu_op,
    output mem_read,  
    output mem_write,
    output alu_src,
    output reg_write,
    output jump
    );
    // write your code here 
    // Remember that we test if the branch is taken or not in the decode stage. 	 
    
    wire reg_dst,mem_to_reg_tmp,mem_read_tmp,mem_write_tmp,alu_src_tmp,reg_write_tmp;
    wire [1:0] alu_op_tmp;
    wire branch_tmp;
    wire Eq_test;
    wire [31:0] shift2;
      
    assign shift2 = imm_value << 2;    
    assign branch_address = pc_plus4 + shift2[9:0];
    assign jump_address = instr[25:0] << 2;
   
    mux2 #(.mux_width(5)) dst_mux (.a(instr[20:16]), .b(instr[15:11]), .sel(reg_dst), .y(destination_reg));
    mux2 #(.mux_width(1)) flush_mux1 (.a(mem_to_reg_tmp), .b(1'b0), .sel(~(Data_Hazard) | Control_Hazard), .y(mem_to_reg));
    mux2 #(.mux_width(2)) flush_mux2 (.a(alu_op_tmp), .b(2'b0), .sel(~(Data_Hazard) | Control_Hazard), .y(alu_op));
    mux2 #(.mux_width(1)) flush_mux3 (.a(mem_read_tmp), .b(1'b0), .sel(~(Data_Hazard) | Control_Hazard), .y(mem_read));
    mux2 #(.mux_width(1)) flush_mux4 (.a(mem_write_tmp), .b(1'b0), .sel(~(Data_Hazard) | Control_Hazard), .y(mem_write));
    mux2 #(.mux_width(1)) flush_mux5 (.a(alu_src_tmp), .b(1'b0), .sel(~(Data_Hazard) | Control_Hazard), .y(alu_src));
    mux2 #(.mux_width(1)) flush_mux6 (.a(reg_write_tmp), .b(1'b0), .sel(~(Data_Hazard) | Control_Hazard), .y(reg_write));
      
    register_file regfile (.clk(clk), .reset(reset), .reg_write_en(mem_wb_reg_write),  .reg_write_dest(mem_wb_write_reg_addr), .reg_write_data(mem_wb_write_back_data), .reg_read_addr_1(instr[25:21]),  .reg_read_addr_2(instr[20:16]), .reg_read_data_1(reg1),  .reg_read_data_2(reg2));
    control con(.reset(reset), .opcode(instr[31:26]), .reg_dst(reg_dst), .mem_to_reg(mem_to_reg_tmp), .alu_op(alu_op_tmp),  .mem_read(mem_read_tmp), .mem_write(mem_write_tmp), .alu_src(alu_src_tmp), .reg_write(reg_write_tmp), .branch(branch_tmp), .jump(jump));
    sign_extend extend(.sign_ex_in(instr[15:0]),.sign_ex_out(imm_value));
    
    assign Eq_test = ((reg1^reg2)==32'd0)?1'b1:1'b0;
    assign branch_taken = branch_tmp & Eq_test;
    
   
    
       
endmodule