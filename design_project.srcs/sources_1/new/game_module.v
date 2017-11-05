`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2017 20:09:56
// Design Name: 
// Module Name: game_module
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


module game_module(
    input CLK,
    input game_speed,
    input [15:0]sw,
    input [4:0]btn,
    output [3:0]an_e,
    output [6:0]seg_e,
    output [15:0]led_e,
    output [11:0]speaker_e,
    output [7:0]row,
    output [3:0]col
    );
    
    wire clk_music;
    FlexiClock cm(100000,CLK,clk_music);
    
    //Module that controls the seven-segment display 
    wire [3:0]first_rand;
    wire [3:0]second_rand;
    wire [3:0]third_rand;
    wire [3:0]fourth_rand;
    randomizer rng(CLK, game_speed, btn, first_rand, second_rand, third_rand, fourth_rand);
   
    //Score module - Checks game state and outputs score in digits form
    //Outputs sound if user input is valid
    wire [3:0]first_score;
    wire [3:0]second_score;
    wire [3:0]third_score;
    wire [3:0]fourth_score;
    score_tracker st(CLK, clk_music, game_speed, first_rand, second_rand, third_rand, fourth_rand , sw, btn,
     first_score, second_score, third_score, fourth_score, speaker_e);
    
    //Displays the current score on the FPGA's LED 
    score_led_display sld(first_score, second_score, third_score, fourth_score, led_e);
    
    //Displays seven_segment
    wire useless;
    reg [3:0] first;
    reg [3:0] second;
    reg [3:0] third;
    reg [3:0] fourth;
    
    sevenseg ss2(CLK, 0, fourth, third, second, first, seg_e[0], seg_e[1], seg_e[2], seg_e[3],
        seg_e[4], seg_e[5], seg_e[6], useless, an_e);
    
    //Displays game note on LED array
        reg [3:0] count1 = 0;
        reg [3:0] count2 = 0;
        reg [3:0] count3 = 0;
        reg [3:0] count4 = 0;
//        always @(posedge game_speed) begin
//          count1 <= (count1 >= 7) ? 0 : count1 + 1; 
//          count2 <= (count2 >= 7) ? 0 : count2 + 1; 
//          count3 <= (count3 >= 7) ? 0 : count3 + 1; 
//          count4 <= (count4 >= 7) ? 0 : count4 + 1; 
//        end
    OutputRowCol(CLK, 0, first, second, third, fourth , row, col);
    
    // Controls what goes out to seven-segment
    // If btn[0] -> middle button is pressed, led displays current score
    // Else shows game state on seven-segment
    always @(posedge CLK) begin
        if (btn[0]) begin
            first <= first_score;
            second <= second_score;
            third <= third_score;
            fourth <= fourth_score;
        end 
        else begin
            first <= first_rand;
            second <= second_rand;
            third <= third_rand;
            fourth <= fourth_rand;
            count1 <= first_rand;
            count2 <= second_rand;
            count3 <= third_rand;
            count4 <= fourth_rand;
        end
    end
    
endmodule