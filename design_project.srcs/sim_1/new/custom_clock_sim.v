`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2017 12:49:49
// Design Name: 
// Module Name: custom_clock_sim
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


module custom_clock_sim(

    );
    reg [31:0]DESIRED_FREQ;
    reg CLK;
    wire FINAL_CLK;
    
    custom_clock cc(DESIRED_FREQ, CLK, FINAL_CLK);
    initial begin 
    CLK = 0;
    end
    
    always begin 
    #5 CLK = ~CLK;
    end

    initial begin
    DESIRED_FREQ = 25000000; #10000;
    DESIRED_FREQ = 16666666; #10000;
    DESIRED_FREQ = 8333333; #10000;
    DESIRED_FREQ = 7142000; #10000;
    DESIRED_FREQ = 6250000; #10000;
    end
    
endmodule
