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
    input CLK,
    input clk_1rr,
    input [15:0]sw,
    input [4:0] btn,
    output reg [3:0]first_rand,
    output reg [3:0]second_rand,
    output reg [3:0]third_rand,
    output reg [3:0]fourth_rand
    );
    
    wire clk_r1;
    wire clk_r2;
    wire clk_r3;
    wire clk_r4;
    FlexiClock cr1(58493821,CLK,clk_r1);
    FlexiClock cr2(21384012,CLK,clk_r2);
    FlexiClock cr3(9049203,CLK,clk_r3);
    FlexiClock cr4(5123492,CLK,clk_r4);
    
    // Personalised random number generator based on CLK
    wire [3:0] random_one;
    wire [3:0] random_two;
    wire [3:0] random_three;
    wire [3:0] random_four;
    my_random_generator rg1(clk_r1, random_one);
    my_random_generator rg2(clk_r2, random_two);
    my_random_generator rg3(clk_r3, random_three);
    my_random_generator rg4(clk_r4, random_four);
    
    always @ (posedge clk_1rr) begin
        //Randomizer to assign random value to first second third fourth
        if (btn[1] || btn[2] || btn[3] || btn[4]) begin
            first_rand <= (random_one == second_rand || random_one == third_rand || random_one == fourth_rand) ? 15 : random_one;
            second_rand <= (random_two == first_rand || random_two == third_rand || random_two == fourth_rand) ? 14 : random_two;
            third_rand <= (random_three == second_rand || random_three == first_rand || random_three == fourth_rand) ? 13 : random_three;
            fourth_rand <= (random_four == second_rand || random_four == third_rand || random_four == first_rand) ? 12 : random_four;
        end
        // If digit = 0, randomize the next number. 
        // Else, countdown.
        else begin
            first_rand <= (first_rand == 0 || (sw[15] && first_rand == 1)) ? 
                                 ((random_one == second_rand || random_one == third_rand || random_one == fourth_rand || random_one == 0) ? 15 : random_one)
                                 : first_rand - 1;
            second_rand <= (second_rand == 0 || (sw[14] && second_rand == 1)) ? 
                                 ((random_two == first_rand || random_two == third_rand || random_two == fourth_rand || random_two == 0) ? 14 : random_two)
                                 : second_rand - 1; 
            third_rand <= (third_rand == 0 || (sw[13] && third_rand == 1)) ? 
                                 ((random_three == second_rand || random_three == first_rand || random_three == fourth_rand || random_three == 0) ? 13 : random_three)
                                 : third_rand - 1;
            fourth_rand <= (fourth_rand == 0 || (sw[12] && fourth_rand == 1)) ? 
                                 ((random_four == second_rand || random_four == third_rand || random_four == first_rand || random_four == 0) ? 12 : random_four)
                                 : fourth_rand - 1;
        end
    end    

    
endmodule