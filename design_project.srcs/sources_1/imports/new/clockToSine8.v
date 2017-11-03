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


module clockToSine8(
    input CLK,
    output [8:0] OUT
    );
    
    reg[8:0] count = 0;
    
    always @ (posedge CLK) begin
        count <= count + 1;
    end
    
    sineLUT sl (1, count, OUT);
    
endmodule
