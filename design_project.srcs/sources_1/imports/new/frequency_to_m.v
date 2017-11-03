`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2017 15:29:37
// Design Name: 
// Module Name: frequency_to_m
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


module frequency_to_m(
    input [31:0] freq,
    output [31:0] m_value
    );
    
    assign m_value = (100000000 / (2 * freq)) - 1;
endmodule
