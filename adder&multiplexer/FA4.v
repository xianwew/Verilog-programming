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

module FA4(
input [3:0] A,
input [3:0] B,
input Cin,
output [3:0] Sum,
output Cout
);
wire [2:0]C;
FA FA0(
       .A(A[0]),
       .B(B[0]),
       .Cin(Cin),
       .Sum(Sum[0]),
       .Cout(C[0])
       );
FA FA1(
       .A(A[1]),
       .B(B[1]),
       .Cin(C[0]),
       .Sum(Sum[1]),
       .Cout(C[1])
       );
FA FA2(
       .A(A[2]),
       .B(B[2]),
       .Cin(C[1]),
       .Sum(Sum[2]),
       .Cout(C[2])
       );
 FA FA3(
       .A(A[3]),
       .B(B[3]),
       .Cin(C[2]),
       .Sum(Sum[3]),
       .Cout(Cout)
       );

endmodule 

