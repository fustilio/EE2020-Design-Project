`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2017 05:24:53
// Design Name: 
// Module Name: my_random_generator
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


module my_random_generator(
    input clk, 
    output [3:0]random_num
    );
    
    reg [3:0] counter = 0;
    
    always@(posedge clk) begin
        counter = (counter == 4'b1111) ? 0 : counter + 1;
    end
    
    assign random_num = ((counter + 81007863) % 5 ) + 12;
    
endmodule