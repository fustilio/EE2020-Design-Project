`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2017 03:49:16 PM
// Design Name: 
// Module Name: task_selector
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


module task_selector(
    input CLK,
    input [11:0] MIC_in,
    input [15:0] sw,
    input [4:0] btn,
    output [15:0] led_selected,
    output [3:0] an_selected,
    output [6:0] seg_selected,
    output dp_selected,
    output [11:0] speaker_selected
    );
    
    parameter TASK_ONE = 4'b0001, TASK_TWO_A = 4'b0010, TASK_TWO_B = 4'b0011,
              TASK_THREE_A = 4'b0100, TASK_THREE_B = 4'b0101, TASK_FOUR = 4'b0110;
    wire [3:0] state;
    assign state[0] = sw[0];
    assign state[1] = sw[1];
    assign state[2] = sw[2];
    assign state[3] = sw[3];
    
    wire clk_100;
    wire clk_20k3b;
    wire clk_30k3b;
    wire clk_50k3b;

    FlexiClock cc100(100,CLK,clk_100);
    FlexiClock cc3b20k(20000,CLK,clk_20k3b);
    FlexiClock cc3b30k(30000,CLK,clk_30k3b);
    FlexiClock cc3b50k(50000,CLK,clk_50k3b);

    //Declare inter values
    reg [11:0] speaker_inter;
    reg [15:0] led_inter;
    reg [3:0] an_inter;
    reg [6:0] seg_inter;
    reg dp_inter;
    
    //Declare lab 1
    wire [15:0] led_oneout;
    wire [11:0] speaker_oneout;
    project_1 mpo(MIC_in, CLK, led_oneout ,speaker_oneout);
    
    //Declare lab 2a values and module
    wire [15:0] led_2a;
    wire [3:0] an_2a;
    wire [6:0] seg_2a;
    wire dp_2a;
    wire [11:0] speaker_2a;
    task2a t2 (CLK, sw, btn, led_2a, an_2a, seg_2a, dp_2a, speaker_2a); 
    
    //Declare lab 2b values and module
    wire [15:0] led_twobout;
    wire [3:0] antwobout;
    wire [6:0] segtwobout;
    project_2b mpt(MIC_in, CLK, btn, led_twobout, antwobout, segtwobout);
    
    //Declare lab 3a values and module
    wire [11:0] delayed;
    task3a t3 (MIC_in, clk_100, delayed); 
    
    //Declare lab 3b values and module
    wire [11:0] mpthreeOut;
    wire [3:0]anthreeb;
    wire [6:0]segthreeb;
    project_3b taskthreeb(CLK, clk_20k3b, clk_30k3b, clk_50k3b, btn, mpthreeOut);
    
    //Declare test function
//    wire [11:0]extra_speaker;
//    project_extra ex(CLK, btn, MIC_in, extra_speaker);
   
  
    
    always @(posedge CLK) begin
        case (state)
            TASK_ONE : begin
                // Assigns 1 LED values
                led_inter <= led_oneout;
                speaker_inter <= speaker_oneout;
                // Default turns off speaker and seven-segment
                an_inter <= 4'b1111;
                seg_inter <= 7'b1111111;
                dp_inter <= 1;
            end TASK_TWO_A : begin
                led_inter <= led_2a;
                speaker_inter <= speaker_2a;
                an_inter <= an_2a;
                seg_inter <= seg_2a;
                dp_inter <= dp_2a;
            end TASK_TWO_B : begin
                // Assigns 2b LED and seven-segment values
                led_inter <= led_twobout;
                an_inter <= antwobout;
                seg_inter <= segtwobout;
                dp_inter <= 1;
                // Default turns off speaker
                speaker_inter <= 0;
            end TASK_THREE_A : begin
                led_inter <= 0;
                an_inter <= 15;
                seg_inter <= 7'b1111111;
                dp_inter <= 1;
                speaker_inter <= delayed;
            end TASK_THREE_B : begin
                // Assigns 3b speaker and seven-segment value to speaker
                speaker_inter <= mpthreeOut;
                // Default turns off LED
                led_inter <= 16'b0;
                an_inter <= 4'b1111;
                seg_inter <= 7'b1111111;
                dp_inter <= 1;
            end default : begin
                speaker_inter <= 0;
                led_inter <= 0;
                an_inter <= 4'b1111;
                seg_inter <= 7'b1111111;
                dp_inter <= 1;
            end
       endcase
    end
    
    assign speaker_selected = speaker_inter;
    assign led_selected = led_inter;
    assign an_selected = an_inter;
    assign seg_selected = seg_inter;
    assign dp_selected = dp_inter;
    
endmodule
