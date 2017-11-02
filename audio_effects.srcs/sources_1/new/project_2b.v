`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2017 15:49:08
// Design Name: 
// Module Name: project_2b
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


module project_2b(
    input [11:0]MIC_in,
    input CLK,
    input [4:0] btn,
    output reg [15:0]led_display,
    output reg [3:0] antwobout,
    output reg [6:0] segtwobout
    );
   
   wire [15:0]chosen_led_high; 
   wire [3:0]chosen_an_high; 
   wire [6:0]chosen_seg_high; 
   wire [15:0]chosen_led_avg; 
   wire [3:0]chosen_an_avg; 
   wire [6:0]chosen_seg_avg;
   wire [3:0]chosen_an_off; 
   wire [6:0]chosen_seg_off;
   
   integer stats = 0;
   averagehigh2b ah2(CLK, MIC_in, chosen_led_high, chosen_an_high, chosen_seg_high);
   averageavg2b al2(CLK, MIC_in, chosen_led_avg, chosen_an_avg, chosen_seg_avg);
   averageoff2b ao2(CLK, chosen_an_off, chosen_seg_off);
   always @(posedge CLK) begin
        if (!btn[0] && !btn[2] && !btn[3]) begin
            if(stats == 0) begin
                led_display = 16'b0;
                antwobout = chosen_an_off;
                segtwobout = chosen_seg_off;
            end
            else if (stats == 1) begin
                led_display = chosen_led_high;
                antwobout = chosen_an_high;
                segtwobout = chosen_seg_high;
            end
            else if (stats == 2) begin
                led_display = chosen_led_avg;
                antwobout = chosen_an_avg;
                segtwobout = chosen_seg_avg;
            end
        end
        else begin
            if (btn[0]) begin
                stats = 0;
                led_display = 16'b0;
                antwobout = chosen_an_off;
                segtwobout = chosen_seg_off;
            end
            else if (btn[2]) begin
                stats = 1;
                led_display = chosen_led_high;
                antwobout = chosen_an_high;
                segtwobout = chosen_seg_high;
            end
            else if (btn[3]) begin
                stats = 2;
                led_display = chosen_led_avg;
                antwobout = chosen_an_avg;
                segtwobout = chosen_seg_avg;
            end
        end
   end
     
endmodule
