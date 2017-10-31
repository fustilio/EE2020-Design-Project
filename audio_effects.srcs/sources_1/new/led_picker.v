`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2017 02:51:10
// Design Name: 
// Module Name: led_picker
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


module led_picker(
    input CLK,
    input [15:0] sw,
    input [15:0] led_display,
    output reg [15:0]led_selected
    );
    
    always@(posedge CLK) begin
        if(sw[1])begin
            led_selected <= led_display;
        end
    end
endmodule
