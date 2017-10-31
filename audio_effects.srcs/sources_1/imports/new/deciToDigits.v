`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2017 11:17:41
// Design Name: 
// Module Name: deciToDigits
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


module deciToDigits(
    input [14:0] INPUT,
    output [3:0] one,
    output [3:0] two,
    output [3:0] three,
    output [3:0] four
    );
    
    integer temp_int;
    integer first;
    integer second;
    integer third;
    integer fourth;
    
    always @(INPUT) begin
        temp_int = INPUT;
        fourth = temp_int % 10;
        temp_int = (temp_int - fourth) / 10; 
        third = temp_int % 10;
        temp_int = (temp_int - third) / 10; 
        second = temp_int % 10;
        temp_int = (temp_int - second) / 10; 
        first = temp_int % 10;
    end
    
    assign one = first;
    assign two = second;
    assign three = third;
    assign four = fourth;
    
endmodule
