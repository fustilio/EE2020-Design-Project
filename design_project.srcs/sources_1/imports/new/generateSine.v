`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2017 15:57:47
// Design Name: 
// Module Name: generateSine
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


module generateSine(
    input [31:0] FREQ,
    input INPUT_CLOCK,
    output [11:0] OUTPUT_SINE
    );
    
    integer period = 256;
    wire output_clock;
        
    FlexiClock fc (FREQ * period, INPUT_CLOCK, output_clock);
    clockToSine8 cs (output_clock, OUTPUT_SINE);
      
    
endmodule