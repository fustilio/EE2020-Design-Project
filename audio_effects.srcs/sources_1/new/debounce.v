`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2017 16:10:31
// Design Name: 
// Module Name: ee2020_lab3_singlePulse
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


module debounce(
    input D,
    input SLOWCLOCK,
    output OUTPUT
    );
    
    wire FIRST;
    wire SECOND;
    
    dff d0 (SLOWCLOCK, D, FIRST);
    dff d1 (SLOWCLOCK, FIRST, SECOND);
    
    assign OUTPUT = FIRST & ~SECOND;
    
    
endmodule
