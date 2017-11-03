`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2017 04:23:33
// Design Name: 
// Module Name: averageoff2b
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


module averageoff2b(
    input CLK,
    output reg [3:0] antwobout_off,
    output reg [6:0] segtwobout_off
    );
    wire clk_3002boff;
    FlexiClock cc2b300off(300,CLK,clk_3002boff);
    
    //LED displayer
    integer countlabtwo_off = 0;
    always@ (posedge clk_3002boff) begin
        if (countlabtwo_off == 0) begin
             //Prints seven segment zero
             antwobout_off[0] <= 1'b0;
             antwobout_off[3:1] <= 3'b111;
             segtwobout_off <= 7'b0111111;
             countlabtwo_off <= 1;
         end
         //Turn on seven-seg[1]
         else if (countlabtwo_off == 1) begin
             antwobout_off[1] <= 1'b0;
             antwobout_off[0] <= 1'b1;
             antwobout_off[3:2] <= 2'b11;
             segtwobout_off <= 7'b0111111;
             countlabtwo_off <= 2;
         end
         else if (countlabtwo_off == 2) begin
             antwobout_off[2] <= 1'b0;
             antwobout_off[3] <= 1'b1;
             antwobout_off[1:0] <= 2'b11;
             segtwobout_off <= 7'b0111111;
             countlabtwo_off <= 3;
         end
         else if (countlabtwo_off == 3) begin
             antwobout_off[3] <= 1'b0;
             antwobout_off[2:0] <= 3'b111;
             segtwobout_off <= 7'b0111111;
             countlabtwo_off <= 0;
         end
    end
endmodule
