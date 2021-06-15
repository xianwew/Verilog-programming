`timescale 1ns / 1ps

// Simple tests for DFF_SR design. Version 1
// This is a simple test. You are responsible 
// for testing more cases. Please read the lab 
// instruction carefully. 

// Please try to comform to the DFF's port 
// declaration order. clk, d, S, R, Q

module tb_dff_SR();
    
reg clk, d, S, R;
wire Q;
    
    // Please try to comform to the DFF's port 
    // declaration order. clk, d, S, R, Q 

dff_SR uut(.clk(clk), .d(d), .S(S), .R(R), .Q(Q));
    
initial begin 
// clock
        clk = 1'b0;
        // preset values 
        d = 1'b0;
        S = 1'b0;
        R = 1'b0;
        
        // test 1 
        // Q should change to 1 on the rising edge of the clock 
        #20 d = 1'b1;
        #35;
        
        
        // test 2 
        // Q should change to 0 on the rising edge of the clock 
        // After R returns to 0, Q should wait until next rising
        // edge of the clock and change to 1. 
        #10 R = 1'b1;
        #30 R = 1'b0;
        
        // test 3
        // on the rising edge of the clock, Q should change to 0
        #20 d = 1'b0; 
        
        // test 4
        // on the rising edge of the clock, Q should change to 1
        // 
        #30 S = 1'b1; 
        #20 S = 1'b0; 
               
        #30 R = 1'b1;
        #20 R = 1'b0;
        
        #30 d = 1'b1;
        #20 d = 1'b0;
        
        #50
        $stop;
    end
    
    always begin
        #10 clk = ~clk;
    end
endmodule
