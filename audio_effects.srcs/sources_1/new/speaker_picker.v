`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2017 01:39:05
// Design Name: 
// Module Name: speaker_picker
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


module speaker_picker(
    input CLK,
    input [15:0]sw,
    input [11:0]hellospeaker20k,
    input [11:0]hellospeaker30k,
    input [11:0]hellospeaker50k,
    input btnU,
    input btnD,
    input btnC,
    output reg [11:0]speaker_selected
    );
    always @(posedge CLK) begin
        if (sw[2]) begin
            if (!btnC) begin
                if (btnU) begin
                    speaker_selected <= hellospeaker50k;
                end
                else if (btnD) begin
                    speaker_selected <= hellospeaker30k;
                end
                else begin
                    speaker_selected <= hellospeaker20k;
                end
            end
        end
    end
endmodule
