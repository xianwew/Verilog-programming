`timescale 1ns / 1ps
module tb_FA4();
reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [3:0] Sum;
wire Cout;
FA4 uut(
.A(A),
.B(B),
.Cin(Cin),
.Sum(Sum),
.Cout(Cout)
);
initial
begin
A = 4'b0110;
B = 4'b0100;
Cin = 1'b0;
# 20;
A = 4'b1000;
B = 4'b1001;
Cin = 1'b1;
# 20;
A = 4'b1110;
B = 4'b0010;
Cin = 1'b0;
# 20;
A = 4'b1010;
B = 4'b1011;
Cin = 1'b0;
# 20;
end
endmodule
