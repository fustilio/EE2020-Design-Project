`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2017 15:54:36
// Design Name: 
// Module Name: project_2b_converter
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


module project_2b_converter(
    input [11:0]twob_led,
    output [15:0]twob_converter
    );
    
    assign twob_converter = twob_led;
    
endmodule
