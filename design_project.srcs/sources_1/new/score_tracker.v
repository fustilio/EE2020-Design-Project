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
    input CLK,
    input clk_music,
    input game_speed,
    input [3:0]first_rand,
    input [3:0]second_rand,
    input [3:0]third_rand,
    input [3:0]fourth_rand,
    input [15:0]sw,
    input [4:0]btn,
    output [3:0]first_score,
    output [3:0]second_score,
    output [3:0]third_score,
    output [3:0]fourth_score,
    output [11:0]speaker_e
    );
    
    reg [14:0] score_holder = 0;
    
    // Outputs sound when note is hit
    // Invalid note hit -> C5
    // Else G4,E4,D4,C4 from left to right respectively
    wire [11:0] C4;
    wire [11:0] D4;
    wire [11:0] E4;
    wire [11:0] G4;
    wire [11:0] NOTE_C4 = 262;
    wire [11:0] NOTE_D4 = 294; 
    wire [11:0] NOTE_E4 = 330;
    wire [11:0] NOTE_G4 = 392; 
    wire [11:0] NOTE_C5 = 523; 
    generateSine gs1 (NOTE_C4, CLK, C4);
    generateSine gs2 (NOTE_D4, CLK, D4);
    generateSine gs3 (NOTE_E4, CLK, E4);
    generateSine gs4 (NOTE_G4, CLK, G4);
    
    reg [11:0] inter = 0;

    reg [2:0] music_player = 0;
    
    always @(posedge clk_music) begin
        if (music_player == 1) begin
            inter = G4;
        end
        else if (music_player == 2) begin
            inter = E4;
        end
        else if (music_player == 3) begin
            inter = D4;
        end
        else if(music_player == 4) begin
            inter = C4;
        end 
        else begin
            inter = 0;
        end
    end
    
    assign speaker_e = inter;
    
    always @(posedge game_speed) begin
        //Resets the score if btn[1] is pressed
        if (btn[1] || btn[2] || btn[3] || btn[4]) begin
            score_holder = 0;
            music_player = 0;
        end
        // Increase score by 1 if correct switch is pressed according 
        // to correct game state
        else if (sw[15] && first_rand == 0) begin
            score_holder = score_holder + 1;
            music_player = 1;
        end
        else if (sw[14] && second_rand == 0) begin
            score_holder = score_holder + 1;
            music_player = 2;
        end
        else if (sw[13] && third_rand == 0) begin
            score_holder = score_holder + 1;
            music_player = 3;
        end
        else if (sw[12] && fourth_rand == 0) begin
            score_holder = score_holder + 1;
            music_player = 4;
        end
        else begin
            music_player = 0;
        end
    end
    
    
    // Convert score from decimal to four digits for seven-segment output display
    deciToDigits dd2(score_holder, first_score, second_score, third_score, fourth_score);
    
endmodule