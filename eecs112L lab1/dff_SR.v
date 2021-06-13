`timescale 1ns / 1ps
module dff_SR(d,clk,R,Q,S);
    input d, clk,R, S;
    output reg Q; 

    always @(posedge clk) 
    begin
        if( S&&!R )
            Q <= 1'b1; 
        else if (!S&&R) 
            Q <= 1'b0;           
        else 
            Q <= d; 
     end 
endmodule 