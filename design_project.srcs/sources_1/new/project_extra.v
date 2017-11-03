`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2017 13:02:43
// Design Name: 
// Module Name: project_extra
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


module project_extra(
    input CLK,
    input [15:0] sw,
    input [4:0]btn,
    output [3:0]an_e,
    output [6:0]seg_e
    );

    //Define game clock
    wire clk_1rr;
    FlexiClock cc1rr(1,CLK,clk_1rr);
    
    //Outputs the randomized 4 values 
    wire [3:0]first_rand;
    wire [3:0]second_rand;
    wire [3:0]third_rand;
    wire [3:0]fourth_rand;
    randomizer rng(clk_1rr, first_rand, second_rand, third_rand, fourth_rand);
   
    //Score module - Checks game state and outputs score in digits form
    wire [3:0]first_score;
    wire [3:0]second_score;
    wire [3:0]third_score;
    wire [3:0]fourth_score;
    score_tracker st(clk_1rr, first_rand, second_rand, third_rand, fourth_rand , sw, first_score, second_score, third_score, fourth_score);
    
        
    //Displays LED
    reg [14:0] LED_displayed;
    wire useless;
    reg [3:0] first;
    reg [3:0] second;
    reg [3:0] third;
    reg [3:0] fourth;
    
    sevenseg ss2(CLK, 0, fourth, third, second, first, seg_e[0], seg_e[1], seg_e[2], seg_e[3],
        seg_e[4], seg_e[5], seg_e[6], useless, an_e);
    
    always @(posedge CLK) begin
        if (btn[0]) begin
            first = first_score;
            second = second_score;
            third = third_score;
            fourth = fourth_score;
        end 
        else begin
            first = first_rand;
            second = second_rand;
            third = third_rand;
            fourth = fourth_rand;
        end
    end
endmodule
