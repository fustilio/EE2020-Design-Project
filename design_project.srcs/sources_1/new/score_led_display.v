`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2017 04:40:43
// Design Name: 
// Module Name: score_led_display
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


module score_led_display(
    input [3:0]first_score, 
    input [3:0]second_score, 
    input [3:0]third_score, 
    input [3:0]fourth_score, 
    output [15:0]led_e
    );
    
    assign led_e[3:0] = fourth_score;
    assign led_e[7:4] = third_score;
    assign led_e[11:8] = second_score;
    assign led_e[15:12] = first_score;
    
endmodule
