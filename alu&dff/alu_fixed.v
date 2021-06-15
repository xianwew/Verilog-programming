`timescale 1ns / 1ps
module alu_fixed (
input [3:0] A,B, // ALU 4- bit Inputs
input [3:0] ALU_Sel ,// ALU Selection
output [3:0] ALU_Out , // ALU 4- bit Output
output CarryOut // Carry Out Flag
);

reg [4:0] tmp ;
reg C;
assign ALU_Out = tmp [3:0] ; // ALU out
assign CarryOut = C;

always @ (*)
begin 

if (ALU_Sel==0)begin //Addition
tmp = A + B;
C = tmp[4];
end
else if(ALU_Sel==1)begin //Subtraction
tmp = A - B;
C = tmp[4];
end
else if(ALU_Sel==2)begin //Multiplication
tmp = A * B;
C = tmp[4];
end
else if(ALU_Sel==3)begin //Divsion
tmp = A / B;
C = tmp[4];
end
else if(ALU_Sel==4)begin //Logical Shift Left
C = A[3];
tmp = A<<1;
end
else if(ALU_Sel==7)begin //rotate right
tmp = {A[0],A[3:1]};
C = 1'b0;
end
else if(ALU_Sel==8)begin //logical And
tmp = A && B;
C = 1'b0;
end
else if(ALU_Sel==14)begin //Greater comparison
tmp = (A>B)? 4'b1 :4'b0;
C = 1'b0;
end

end
endmodule
