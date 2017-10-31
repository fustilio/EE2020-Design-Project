`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2017 14:57:36
// Design Name: 
// Module Name: led_max_converter
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


module led_max_converter(
    input [11:0]LED_MAX,
    input clk_5,
    output reg [15:0]LED_DISPLAY
    );
    always @ (posedge clk_5) begin
    if (LED_MAX <= 2048) begin
        LED_DISPLAY <= 16'b0;
    end
    else if (LED_MAX > 2048 && LED_MAX <= 2176) begin
        LED_DISPLAY <= 16'b1;
    end
    else if (LED_MAX > 2176 && LED_MAX <= 2304) begin
        LED_DISPLAY <= 16'b11;
    end
    else if (LED_MAX > 2304 && LED_MAX <= 2432) begin
        LED_DISPLAY <= 16'b111;
    end
    else if (LED_MAX > 2432 && LED_MAX <= 2560) begin
        LED_DISPLAY <= 16'b1111;
    end
    else if (LED_MAX > 2560 && LED_MAX <= 2688) begin
        LED_DISPLAY <= 16'b11111;
    end
    else if (LED_MAX > 2688 && LED_MAX <= 2816) begin
        LED_DISPLAY <= 16'b111111;
    end
    else if (LED_MAX > 2816 && LED_MAX <= 2944) begin
        LED_DISPLAY <= 16'b1111111;
    end
    else if (LED_MAX > 2944 && LED_MAX <= 3072) begin
        LED_DISPLAY <= 16'b11111111;
    end
    else if (LED_MAX > 3072 && LED_MAX <= 3200) begin
        LED_DISPLAY <= 16'b111111111;
    end
    else if (LED_MAX > 3200 && LED_MAX <= 3328) begin
        LED_DISPLAY <= 16'b1111111111;
    end
    else if (LED_MAX > 3328 && LED_MAX <= 3456) begin
        LED_DISPLAY <= 16'b11111111111;
    end
    else if (LED_MAX > 3456 && LED_MAX <= 3584) begin
        LED_DISPLAY <= 16'b111111111111;
    end    
    else if (LED_MAX > 3584 && LED_MAX <= 3712) begin
        LED_DISPLAY <= 16'b1111111111111;
    end  
    else if (LED_MAX > 3712 && LED_MAX <= 3840) begin
        LED_DISPLAY <= 16'b11111111111111;
    end  
    else if (LED_MAX > 3840 && LED_MAX <= 3956) begin
        LED_DISPLAY <= 16'b111111111111111;
    end  
    else if (LED_MAX > 3956 && LED_MAX <= 4096) begin
        LED_DISPLAY <= 16'b1111111111111111;
    end  
    end
endmodule
