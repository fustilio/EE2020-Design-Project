`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2017 03:00:59 PM
// Design Name: 
// Module Name: clockToSound
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


module clockToSound(
    input CLK,
    output reg [5:0] OUT = 0
    );

    always @ (posedge CLK) begin
        OUT <= ~OUT;
    end
    
endmodule
