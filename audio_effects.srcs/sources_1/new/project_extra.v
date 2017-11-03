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
    input [4:0]btn,
    input [11:0]MIC_in,
    output reg [11:0]extra_speaker
    );
    reg [11:0] huge_memory [0:1048576];
    
    wire clk_20ke;
    FlexiClock cc20ke(20000,CLK,clk_20ke);
    
    reg [19:0]memory_pointer = 20'b0;
    reg [19:0]playback_pointer = 20'b0;
    
    always@(posedge clk_20ke) begin
        if(btn[0] && !btn[1]) begin
            huge_memory[memory_pointer] <= MIC_in;
            memory_pointer = (memory_pointer >= 20'b11111111111111111111) ? 0 : memory_pointer + 1;
        end
        else if (btn[1] && !btn[0]) begin
            extra_speaker <= huge_memory[playback_pointer];
            playback_pointer = (playback_pointer >= 20'b11111111111111111111) ? 0 : playback_pointer + 1;
        end
    end
endmodule
