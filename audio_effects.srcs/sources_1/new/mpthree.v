`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2017 20:25:25
// Design Name: 
// Module Name: mpthree
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


module mpthree(
    input clk,
    output reg [11:0] hellospeaker
    );
    reg [12:0]bincounter = 13'b0;
    always @ (posedge clk) begin
          bincounter <= (bincounter == 13'b1111111111111) ? 13'b0 : bincounter + 1;
    end
    dist_mem_gen_0 dmg(bincounter,hellospeaker);
endmodule
