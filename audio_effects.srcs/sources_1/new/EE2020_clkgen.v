`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2017 14:40:33
// Design Name: 
// Module Name: ee2020_lab3_slowerBlinky
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


module EE2020_clkgen(input CLOCK, output reg clk_20k, reg clk_50M);

    reg [11:0] COUNT_20k = 0;
    reg COUNT_50M = 0;
   
    always @ (posedge CLOCK) begin
        COUNT_20k <= (COUNT_20k == 2499) ? 0 : COUNT_20k + 1;
        clk_20k <= (COUNT_20k == 0) ? ~clk_20k : clk_20k;
        
        COUNT_50M <= (COUNT_50M == 0) ? 0 : COUNT_50M + 1;
        clk_50M <= (COUNT_50M == 0) ? ~clk_50M : clk_50M;
    end
    
    
endmodule