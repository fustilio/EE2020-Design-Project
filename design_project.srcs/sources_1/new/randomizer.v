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
    input [4:0] btn,
    output reg [3:0]first_rand,
    output reg [3:0]second_rand,
    output reg [3:0]third_rand,
    output reg [3:0]fourth_rand
    );
     
    always @ (posedge clk_1rr) begin
        //Randomizer to assign random value to first second third fourth
        if (btn[1] || btn[2] || btn[3] || btn[4]) begin
            first_rand = 8;
            second_rand = 6;
            third_rand = 4;
            fourth_rand = 1;
        end
        // If digit = 0, randomize the next number. 
        // Else, countdown.
        else begin
            first_rand = (first_rand == 0) ? 8 : first_rand - 1;
            second_rand = (second_rand == 0) ? 6 : second_rand - 1;
            third_rand = (third_rand == 0) ? 4 : third_rand - 1;
            fourth_rand = (fourth_rand == 0) ? 1 : fourth_rand - 1;
        end
    end    

    
endmodule
