`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2017 15:28:22
// Design Name: 
// Module Name: m_to_clock
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


module m_to_clock(
    input [31:0] M_VALUE,
    input INPUT_CLOCK,
    output reg OUTPUT_CLOCK = 0
    );
    
    reg [31:0] COUNT = 0;
    
    always @ (posedge INPUT_CLOCK) begin
        COUNT <= (COUNT == M_VALUE) ? 0 : COUNT + 1;
        OUTPUT_CLOCK <= (COUNT == 0) ? ~OUTPUT_CLOCK : OUTPUT_CLOCK;
    end
    
endmodule
