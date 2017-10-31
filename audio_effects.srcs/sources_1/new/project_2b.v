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
    input clk1,
    input clk2,
    output reg [15:0]led_display, 
    output reg [13:0]sevensegment2b
    );
   reg [11:0]FINAL_MIC;
   
   //clk1 has a frequency 200 times higher than clk2
   //This means that clk1 has a period that is 200 times shorter
   //This always block checks 200 samples, find the greatest and assigns it to FINAL_MIC
   always @(posedge clk1) begin
        if (MIC_in > FINAL_MIC) begin
            FINAL_MIC = MIC_in;
        end
   end
   
   //As mentioned previously, clk2 has a larger period - Larger by 200 times
   //Thus, after the 200 samples, this code will convert the largest value
   //into a 16-bit output and display it on the FPGA, resetting the largest
   //value(FINAL_MIC) before exiting the always block. 
    always @(posedge clk2) begin
        if (MIC_in <= 2048) begin
            led_display <= 16'b0;
            //Display 00
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b1000000;
        end
        else if (MIC_in > 2048 && MIC_in <= 2176) begin
            led_display <= 16'b1;
            //Display 01
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b1111001;
        end
        else if (MIC_in > 2176 && MIC_in <= 2304) begin
            led_display <= 16'b11;
            //Display 02
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b0100100;
        end
        else if (MIC_in > 2304 && MIC_in <= 2432) begin
            led_display <= 16'b111;
            //Display 03
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b0110000;
        end
        else if (MIC_in > 2432 && MIC_in <= 2560) begin
            led_display <= 16'b1111;
            //Display 04
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b0011001;
        end
        else if (MIC_in > 2560 && MIC_in <= 2688) begin
            led_display <= 16'b11111;
            //Display 05
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b0010010;
        end
        else if (MIC_in > 2688 && MIC_in <= 2816) begin
            led_display <= 16'b111111;
            //Display 06
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b0000010;
        end
        else if (MIC_in > 2816 && MIC_in <= 2944) begin
            led_display <= 16'b1111111;
            //Display 07
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b1111000;
        end
        else if (MIC_in > 2944 && MIC_in <= 3072) begin
            led_display <= 16'b11111111;
            //Display 08
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b0000000;
        end
        else if (MIC_in > 3072 && MIC_in <= 3200) begin
            led_display <= 16'b111111111;
            //Display 09
            sevensegment2b[13:7] = 7'b1000000;
            sevensegment2b[6:0] = 7'b0010000;
        end
        else if (MIC_in > 3200 && MIC_in <= 3328) begin
            led_display <= 16'b1111111111;
            //Display 10
            sevensegment2b[13:7] = 7'b1111001;
            sevensegment2b[6:0] = 7'b1000000;
        end
        else if (MIC_in > 3328 && MIC_in <= 3456) begin
            led_display <= 16'b11111111111;
            //Display 11
            sevensegment2b[13:7] = 7'b1111001;
            sevensegment2b[6:0] = 7'b1111001;
        end
        else if (MIC_in > 3456 && MIC_in <= 3584) begin
            led_display <= 16'b111111111111;
            //Display 12
            sevensegment2b[13:7] = 7'b1111001;
            sevensegment2b[6:0] = 7'b0100100;
        end    
        else if (MIC_in > 3584 && MIC_in <= 3712) begin
            led_display <= 16'b1111111111111;
            //Display 13
            sevensegment2b[13:7] = 7'b1111001;
            sevensegment2b[6:0] = 7'b0110000;
        end  
        else if (MIC_in > 3712 && MIC_in <= 3840) begin
            led_display <= 16'b11111111111111;
            //Display 14
            sevensegment2b[13:7] = 7'b1111001;
            sevensegment2b[6:0] = 7'b0011001;
        end  
        else if (MIC_in > 3840 && MIC_in <= 3956) begin
            led_display <= 16'b111111111111111;
            //Display 15
            sevensegment2b[13:7] = 7'b1111001;
            sevensegment2b[6:0] = 7'b0010010;
        end  
        else begin
            led_display <= 16'b1111111111111111;
            //Display 16
            sevensegment2b[13:7] = 7'b1111001;
            sevensegment2b[6:0] = 7'b0000010;
        end  
        
        FINAL_MIC <= 12'b0;
    end
endmodule
