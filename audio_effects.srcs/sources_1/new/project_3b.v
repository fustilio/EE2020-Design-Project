`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2017 20:28:37
// Design Name: 
// Module Name: project_3b
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


module project_3b(
    input CLK,
    input clk_20k3b,
    input clk_30k3b,
    input clk_50k3b,
    input [4:0] btn,
    output [11:0] hellospeaker
    );
    reg [12:0]bincounter = 13'b0;
    reg [12:0]bincounter20k = 13'b0;
    reg [12:0]bincounter30k = 13'b0;
    reg [12:0]bincounter50k = 13'b0;
        
    //Loop to increase memory address bit and extract data
    always @(posedge clk_20k3b) begin
          bincounter20k <= (bincounter20k == 13'b1111111111111) ? 13'b0 : bincounter20k + 1;
    end
    
    always @(posedge clk_30k3b) begin
          bincounter30k <= (bincounter30k == 13'b1111111111111) ? 13'b0 : bincounter30k + 1;
    end
    
    always @(posedge clk_50k3b) begin
          bincounter50k <= (bincounter50k == 13'b1111111111111) ? 13'b0 : bincounter50k + 1;
    end
    
    //Figure out which frequency to call
    // btn[0] -> Centre -> Pause sound
    // btn[1] -> Up -> Plays 50kHz sound
    // btn[4] -> Down -> Plays 30kHz sound
    // Default -> Plays 20kHx sound
    always @(posedge CLK) begin
        if (!btn[0]) begin
            if(btn[1]) begin
                bincounter <= bincounter50k;
            end
            else if (btn[4]) begin
                bincounter <= bincounter30k;
            end
            else begin
                bincounter <= bincounter20k;
            end
        end
    end
    
    dist_mem_gen_0 dmg(bincounter,hellospeaker);
endmodule
