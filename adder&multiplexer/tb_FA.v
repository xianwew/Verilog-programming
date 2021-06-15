`timescale 1ns / 1ps
module tb_FA();
reg A_tb = 0;
reg B_tb = 0;
reg Cin_tb = 0;
wire Sum_tb;
wire Cout_tb ;
FA instant
(
.A( A_tb ),
.B( B_tb ),
.Cin( Cin_tb ),
. Sum ( Sum_tb ),
. Cout ( Cout_tb )
);
initial
begin
A_tb = 1'b0;
B_tb = 1'b1;
Cin_tb = 1'b0;
# 20;
A_tb = 1'b1;
B_tb = 1'b1;
Cin_tb = 1'b0;
# 20;
A_tb = 1'b1;
B_tb = 1'b1;
Cin_tb = 1'b1;
# 20;
end
endmodule
