`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2017 21:42:43
// Design Name: 
// Module Name: m_value_getter
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


module m_value_getter(
    input [31:0]DESIRED_FREQ,
    input CLK,
    output [31:0]M_VALUE
    );
    
    real startTime,endTime;
    real frequency; 
    
    initial begin
    @(posedge CLK) startTime = $realtime;
    @(posedge CLK) endTime = $realtime;
    frequency = 1.0e9 / (endTime - startTime);
    end 
    
    assign M_VALUE = (100000000 / (2 * DESIRED_FREQ)) - 1;
    
endmodule
