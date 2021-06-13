`timescale 1ns / 1ps
module RegFile(clk,reset,rg_wrt_en,rg_wrt_addr,rg_rd_addr1,rg_rd_addr2,rg_rd_data1,rg_rd_data2,rg_wrt_data);
input [31:0] rg_wrt_data;
input clk,reset;
input rg_wrt_en;
input  [4:0]rg_rd_addr1,rg_rd_addr2;
input  [4:0]rg_wrt_addr;

output  [31:0]rg_rd_data1,rg_rd_data2;
reg [31:0]register_file[31:0];
integer i;

always @ (*)begin
if(reset)
for (i=0; i<32; i=i+1)
register_file[i] <= 32'h0;
end

always @ (posedge clk) begin
if (~reset && rg_wrt_en)
register_file[rg_wrt_addr] = rg_wrt_data;
end

assign rg_rd_data1 = register_file [rg_rd_addr1];
assign rg_rd_data2 = register_file [rg_rd_addr2];

endmodule