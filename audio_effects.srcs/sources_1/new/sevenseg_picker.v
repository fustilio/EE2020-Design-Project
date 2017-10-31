`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2017 03:50:37
// Design Name: 
// Module Name: sevenseg_picker
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


module sevenseg_picker(
    input clk_100,
    input [15:0] sw,
    input [13:0] sevensegment2b,
    output reg [3:0]an_selected,
    output reg [6:0]seg_selected
    );
    
    reg countlabtwo = 0;
    
    always @(posedge clk_100) begin
        if (sw[1]) begin
            if (countlabtwo == 0) begin
                //Prints seven segment zero
                an_selected[3:2] <= 2'b11;
                an_selected[0] <= 1'b0;
                an_selected[1] <= 1'b1;
                seg_selected <= sevensegment2b[6:0];
                countlabtwo <= 1;
            end
            //Turn on seven-seg[1]
            else if (countlabtwo == 1) begin
                //Prints seven segment one if seg != 0 
                an_selected[3:2] <= 2'b11;
                an_selected[0] <= 1'b1;
                an_selected[1] <= (sevensegment2b[13:7] == 7'b1000000) ? 1'b1 : 1'b0;
                seg_selected <= sevensegment2b[13:7];
                countlabtwo <= 0;
            end
        end
    end
          
endmodule
