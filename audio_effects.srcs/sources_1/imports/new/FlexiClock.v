`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2017 14:41:16
// Design Name: 
// Module Name: FlexiClock
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


module FlexiClock(
    input [31:0] FREQ,
    input INPUT_CLOCK,
    output OUTPUT_CLOCK
    );
    
    wire [31:0] m;
    
    frequency_to_m ftm (FREQ, m);
    m_to_clock mtc (m, INPUT_CLOCK, OUTPUT_CLOCK);    
    
endmodule
