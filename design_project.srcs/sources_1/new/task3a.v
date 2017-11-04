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
    input clk_10k,
    input CLK,
    input switch,
    output [11:0] OUT
    );
    
    wire [11:0] default_output;
    wire [11:0] circular_output;
    
    task3a_default df (IN, clk_10k, default_output);
    task3a_circular circ (IN, CLK, circular_output);
    
    reg [11:0] inter_output;
    always @(switch) begin
        if (switch) begin
            inter_output <= circular_output;
        end else begin
            inter_output <= default_output;
        end
    end
    
    assign OUT = inter_output;
    
    
        
endmodule
