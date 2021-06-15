`timescale 1ns / 1ps
module tb_alu();
reg[3:0] A,B;
reg[3:0] ALU_Sel;
wire[3:0] ALU_Out;
wire CarryOut;
integer Q,K;

alu_fixed uut(
.A(A), 
.B(B),
.ALU_Sel(ALU_Sel),
.ALU_Out(ALU_Out),
.CarryOut(CarryOut));


initial begin
#20;
ALU_Sel = 4'b0000;
        for (Q=0; Q<16; Q=Q+1)begin
            A = Q;
            for (K=0; K<16; K=K+1)begin
                B=K;
                #1;
             end
         end
#20;
ALU_Sel = 4'b0010;
        for (Q=0; Q<16; Q=Q+1)begin
            A = Q;
            for (K=0; K<16; K=K+1)begin
                B=K;
                #1;
             end
         end
#20;
ALU_Sel = 4'b0100;
        for (Q=0; Q<16; Q=Q+1)begin
            A = Q;
            for (K=0; K<16; K=K+1)begin
                B=K;
                #1;
             end
         end
#20;
ALU_Sel = 4'b0111;
        for (Q=0; Q<16; Q=Q+1)begin
            A = Q;
            for (K=0; K<16; K=K+1)begin
                B=K;
                #1;
             end
         end
#20;
ALU_Sel = 4'b1000;
        for (Q=0; Q<16; Q=Q+1)begin
            A = Q;
            for (K=0; K<16; K=K+1)begin
                B=K;
                #1;
             end
         end
#20;
 ALU_Sel = 4'b1110;
        for (Q=0; Q<16; Q=Q+1)begin
            A = Q;
            for (K=0; K<16; K=K+1)begin
                B=K;
                #1;
             end
         end    
    
end  
endmodule
