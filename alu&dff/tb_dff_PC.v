`timescale 1ns / 1ps

// Simple tests for DFF_PC design. Version 1

// This is a simple test. You are responsible 
// for testing more cases. Please read the lab 
// instruction carefully. 

// Please try to comform to the DFF's port 
// declaration order. clk, d,P, C, Q 



module tb_dff_PC(

    );
    
    reg clk, d, P, C;
    wire Q;
    
    // Please try to comform to the DFF's port 
    // declaration order. clk, d, P, C, Q 

    
    dff_PC instant(.clk(clk), .d(d), .P(P), .C(C), .Q(Q));
    
    initial begin 
        // clock
        clk = 1'b0;
        // preset values 
        d = 1'b0;
        P = 1'b0;
        C = 1'b0;
        
        // test 1
        // Q should change to 1 on the rising edge of the clock 
        #20 d = 1'b1;
        #35;
        
        // test 2
        // Q should change to 0 right after C is 1;
        // After C is changed to 0 again,
        // Q should wait until next rising edge of clk
        // and change to 1.
        #10 C = 1'b1;
        #30 C = 1'b0;
        
        // test 3 
        // on the rising edge of the clock, Q should change to 0
        #20 d = 1'b0; 
        
        // test 4
        // Right after P change to 1, Q should change to 1
        // 
        #30 P = 1'b1; 
        #20 P = 1'b0; 
               
        #30 C = 1'b1;
        #20 C = 1'b0;
        
        #30 d = 1'b1;
        #20 d = 1'b0;
        
        #50
        $stop;
    end
    
    always begin
        #10 clk = ~clk;
    end
endmodule
