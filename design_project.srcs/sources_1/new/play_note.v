`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2017 00:26:48
// Design Name: 
// Module Name: play_note
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


module play_note(
    input CLK, 
    input [11:0]note_temp, 
    output [11:0]speaker_e
    );
    
    generateSine gs89 (note_temp, CLK, speaker_e);
    
    always @(posedge CLK) begin
            
    end
    
endmodule
