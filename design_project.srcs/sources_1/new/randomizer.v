`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2017 00:38:34
// Design Name: 
// Module Name: randomizer
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


module randomizer(
    input clk_1rr,
    output reg [3:0]first_rand,
    output reg [3:0]second_rand,
    output reg [3:0]third_rand,
    output reg [3:0]fourth_rand
    );
    
    //Randomizer to assign random value to first second third fourth 
    always @ (posedge clk_1rr) begin
         first_rand = (first_rand == 0) ? 8 : first_rand - 1;
         second_rand = (second_rand == 0) ? 6 : second_rand - 1;
         third_rand = (third_rand == 0) ? 4 : third_rand - 1;
         fourth_rand = (fourth_rand == 0) ? 1 : fourth_rand - 1;
    end    

    
endmodule
