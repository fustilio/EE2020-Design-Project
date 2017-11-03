`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2017 15:05:29
// Design Name: 
// Module Name: m_value_getter_sim
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


module m_value_getter_sim(
    );
    reg [31:0]DESIRED_FREQ;
    reg CLK;
    wire [31:0]M_VALUE;
    
    m_value_getter test1(DESIRED_FREQ, CLK, M_VALUE);
        
    initial begin 
    CLK = 0; #20;
    end
    
    always begin 
    #5 CLK = ~CLK;
    end

    initial begin
    DESIRED_FREQ = 25000000; #20;
    DESIRED_FREQ = 16666666; #20;
    DESIRED_FREQ = 8333333; #20;
    DESIRED_FREQ = 7142000; #20;
    DESIRED_FREQ = 6250000; #20;
    end
    
endmodule
