`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2017 16:07:17
// Design Name: 
// Module Name: get_frequency_from_m
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


module get_frequency_from_m(
    input [31:0]M,
    input CLK,
    output reg FINAL_CLK = 0
    );
    reg [31:0]COUNT = 0;
    
    always @(posedge CLK)
    begin
        COUNT <= (COUNT == M) ? 0 : COUNT + 1;
        FINAL_CLK <= (COUNT == 0) ? ~FINAL_CLK : FINAL_CLK;
    end

endmodule
