`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2017 03:49:16 PM
// Design Name: 
// Module Name: task_selector
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


module task_selector(
    input CLK,
    input [15:0] sw,
    input [4:0] btn,
    input [15:0] led_display,
    output reg [3:0]an_selected,
    output reg [6:0]seg_selected,
    output [11:0]speaker_selected
    );
    
    wire clk_100;
    
    wire clk_20k2a;
    wire clk_1002a;
    wire clk_20k3b;
    wire clk_30k3b;
    wire clk_50k3b;
    wire clk_20k;
    wire clk_50M;

    FlexiClock cc100(100,CLK,clk_100);
    FlexiClock cc2a20k(20000,CLK,clk_20k2a);
    FlexiClock cc2a100(100,CLK,clk_1002a);
    FlexiClock cc3b20k(20000,CLK,clk_20k3b);
    FlexiClock cc3b30k(30000,CLK,clk_30k3b);
    FlexiClock cc3b50k(50000,CLK,clk_50k3b);


    wire [11:0] mpthreeOut;
    wire [11:0] hellospeaker50k;
    wire [11:0] hellospeaker30k;
    project_3b mpthree20k(clk_20k3b, mpthreeOut);
    reg [11:0] speaker_inter;
    project_3b mpthree50k(clk_50k3b, hellospeaker50k);
    //Plays if btnD
    project_3b mpthree5k(clk_30k3b, hellospeaker30k);
    
    always @(posedge CLK) begin
        if (sw[2]) begin
            speaker_inter = mpthreeOut;
        end else if (sw[3]) begin
            speaker_inter = hellospeaker50k;
        end else if (sw[1]) begin
            speaker_inter = hellospeaker30k;
        end else begin
            speaker_inter = 0;
        end
    end
    
    assign speaker_selected = speaker_inter;
    
endmodule
