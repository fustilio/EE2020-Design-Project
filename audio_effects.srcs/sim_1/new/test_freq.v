`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2017 03:41:27 PM
// Design Name: 
// Module Name: test_freq
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_freq(

    );
    
    // Inputs
    reg [31:0] A;
    
    reg CLOCK; wire OUTPUT;
    
    FlexiClock dut (A, CLOCK, OUTPUT);
//    frequency_to_m dut(A, OUTPUT);    
//    m_to_clock dut2 (B, CLOCK, OUTPUT);
        
    initial begin
        CLOCK = 0;
    end
    
    always begin
        #5 CLOCK = ~CLOCK;
    end

    
    //Stimuli
    initial begin
        A = 20000; #10000;
        A = 50000; #10000;
        A = 400; #10000;
        A = 1500; #10000;    
    end 

//    initial begin
//        B = 0; #100;
//        B = 5000; #100;
//        B = 300; #100;
//        B = 14142; #100;    
//    end 
    
endmodule
