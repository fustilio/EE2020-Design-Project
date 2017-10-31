`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2017 14:45:49
// Design Name: 
// Module Name: two_hundred_samples
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


module fourty_samples(
    input [11:0]MIC_IN,
    input clk_200,
    output reg [11:0]LED_MAX
    );
    reg count = 0;
    always @ (posedge clk_200) 
    begin
    if(count >= 40) begin
        LED_MAX <= 12'b111111111111;
    end
    else begin
        count = count + 1;
        LED_MAX = (MIC_IN > LED_MAX) ? MIC_IN : LED_MAX;
    end
    end
endmodule

