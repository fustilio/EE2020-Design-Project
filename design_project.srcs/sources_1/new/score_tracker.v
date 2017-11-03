`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2017 00:58:11
// Design Name: 
// Module Name: score_tracker
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


module score_tracker(
    input clk_1rr,
    input [3:0]first_rand,
    input [3:0]second_rand,
    input [3:0]third_rand,
    input [3:0]fourth_rand,
    input [15:0]sw,
    output [3:0]first_score,
    output [3:0]second_score,
    output [3:0]third_score,
    output [3:0]fourth_score
    );
    
    reg [14:0] score_holder;
    
    always @(posedge clk_1rr) begin
        if (sw[15] && first_rand == 0) begin
            score_holder = score_holder + 1;
        end
        else if (sw[14] && second_rand == 0) begin
            score_holder = score_holder + 1;
        end
        else if (sw[13] && third_rand == 0) begin
            score_holder = score_holder + 1;
        end
        else if (sw[12] && fourth_rand == 0) begin
            score_holder = score_holder + 1;
        end
    end
    
    deciToDigits dd2(score_holder, first_score, second_score, third_score, fourth_score);
    
endmodule
