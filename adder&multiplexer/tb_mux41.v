`timescale 1ns / 1ps
module tb_Mux41();
reg [1:0]S;
reg D0,D1,D2,D3;
wire Y;
Mux41 uut(
.S(S),
.D0(D0),
.D1(D1),
.D2(D2),
.D3(D3),
.Y(Y)
);
initial
   begin
   D0 = 1'b0; 
   D1 = 1'b1;
   D2 = 1'b0;
   D3 = 1'b1;
    S = 2'b00;
    #20;
    D0 = 1'b0; 
   D1 = 1'b1;
   D2 = 1'b0;
   D3 = 1'b1;
    S = 2'b01;
    #20;
    D0 = 1'b0; 
   D1 = 1'b1;
   D2 = 1'b0;
   D3 = 1'b1;
    S = 2'b10;
    #20;
    D0 = 1'b0; 
   D1 = 1'b1;
   D2 = 1'b0;
   D3 = 1'b1;
    S = 2'b11;
    #20;
end
endmodule
