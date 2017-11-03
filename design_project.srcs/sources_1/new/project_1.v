`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2017 17:54:31
// Design Name: 
// Module Name: project_1
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


module project_1(
    input [11:0]MIC_in,
    input CLK,
    output reg [15:0]led_oneout,
    output [11:0]speaker_oneout
    );
    
    wire clk_viewable;
    FlexiClock ccview(25,CLK,clk_viewable);
    
    always @ (posedge clk_viewable) begin
        led_oneout[11:0] = MIC_in;
    end
    assign speaker_oneout = MIC_in; 
endmodule
