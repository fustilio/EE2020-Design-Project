`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2017 02:50:27
// Design Name: 
// Module Name: task3a
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


module task3a(
    input [11:0] IN,
    input CLK,
    input switch,
    input [4:0] btn,
    output [11:0] OUT,
    output [3:0] an,
    output [6:0] seg
    );
    
    wire [11:0] default_output;
    wire [11:0] circular_output;
    wire [3:0] circular_an;
    wire [6:0] circular_seg;
    
    wire clk_10k;

        
    FlexiClock fc0 (10000, CLK, clk_10k);
    
    task3a_default df (IN, clk_10k, default_output);
    task3a_circular circ (IN, CLK, btn, circular_output, circular_an, circular_seg);
    
    reg [11:0] inter_output;
    reg [3:0] inter_an;
    reg [6:0] inter_seg;
    
    always @(posedge clk_10k) begin
        if (switch) begin
            inter_output <= circular_output;
        end else begin
            inter_output <= default_output;
            inter_an <= 4'b1111;
            inter_seg <= 7'b1111111;
        end
    end
    
    assign OUT = inter_output;
    assign an = inter_an;
    assign seg = inter_seg;
    
    
        
endmodule
