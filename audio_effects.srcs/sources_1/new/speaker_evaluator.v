`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2017 21:01:42
// Design Name: 
// Module Name: speaker_evaluator
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


module speaker_evaluator(
    input lab3switch,
    input lab2switch,
    input lab1switch,
    input [11:0]hellospeaker,
    output reg [11:0]speaker_holder
    );
    always @(*) begin
      if(lab3switch && lab2switch && lab1switch) begin
          speaker_holder = hellospeaker;
      end
    end
endmodule
