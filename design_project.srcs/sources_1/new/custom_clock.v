`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2017 12:30:26
// Design Name: 
// Module Name: custom_clock
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


module custom_clock(
    input [31:0]DESIRED_FREQ,
    input CLK,
    output FINAL_CLK
    );
    wire [31:0]M_VALUE;
    
    m_value_getter mvg(DESIRED_FREQ,CLK,M_VALUE);
    get_frequency_from_m gffm(M_VALUE,CLK,FINAL_CLK);
    
endmodule
