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
    input [4:0] btn,
    output [3:0] an_e,
    output [6:0] seg_e,
    output [15:0] led_e,
    output [11:0] speaker_e,
    output [7:0]row,
    output [3:0]col
    );

    //Define respective difficulties' game clock
    wire clk_level1;
    wire clk_level2;
    wire clk_level3;
    wire clk_debugging;
    FlexiClock clvl1(4,CLK,clk_level1);
    FlexiClock clvl2(8,CLK,clk_level2);
    FlexiClock clvl3(16,CLK,clk_level3);
    FlexiClock cdebug(1000,CLK,clk_debugging);
    
    // Integer to store the game difficulty
    integer game_difficulty = 0;
    
    // Instantiation of game module
    wire game_speed;
    game_module (CLK, game_speed, sw, btn, an_e, seg_e, led_e, speaker_e, row, col);

    // btn[2] -> Left button -> Easiest difficulty 1 sec refresh rate
    // btn[3] -> Right button -> Intermediate difficulty 0.5 sec refresh rate
    // btn[4] -> Down button -> Difficult difficulty 0.25 sec refresh rate
    // Default -> Easiest difficulty
    // Pressing a button refreshes the 
    reg game_speed_inter;
    always@(posedge CLK) begin
        if(!btn[2] && !btn[3] && !btn[4] && sw[1] && sw[2] && sw[1]) begin
            case (game_difficulty)
            0: begin
                game_speed_inter = clk_level1;
            end 
            1: begin 
                game_speed_inter = clk_level2;
            end 
            2: begin
                game_speed_inter = clk_level3;
            end
            default: begin
                game_speed_inter = clk_debugging;
            end
            endcase
        end
        else begin
            if(btn[2] && !btn[3] && !btn[4] && sw[2] && sw[1]) begin
                game_difficulty = 0;
                game_speed_inter = clk_level1;
            end
            else if (!btn[2] && !btn[3] && btn[4] && sw[2] && sw[1]) begin
                game_difficulty = 1;
                game_speed_inter = clk_level2;
            end
            else if (!btn[2] && btn[3] && !btn[4] && sw[2] && sw[1]) begin
                game_difficulty = 2;
                game_speed_inter =  clk_level3;
            end
        end
    end
    
    // After determining game difficulty, push it to instantiated game module
    assign game_speed = game_speed_inter;
    
endmodule