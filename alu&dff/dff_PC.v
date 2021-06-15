`timescale 1ns / 1ps
 module dff_PC(clk,d,P,C,Q);
    output  reg  Q; 
    input  d, clk, C, P; 

always @(posedge clk or posedge C or posedge P) 
begin 
if (P) 
Q <= 1'b1;
else if(C)
Q <= 1'b0;
else
Q <= d;      
end 

    
endmodule
