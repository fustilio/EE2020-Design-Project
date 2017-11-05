`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2017 15:47:53
// Design Name: 
// Module Name: ee2020_lab3_dff
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


module dff(input DFF_CLOCK, D, output reg Q);
    always @ (posedge DFF_CLOCK) begin
        Q <= D;
    end
endmodule