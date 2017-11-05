`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2017 02:50:27
// Design Name: 
// Module Name: task3a
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


module task3a_circular(
    input [11:0] IN,
    input CLK, // assume 100MHz
    input [4:0] btn,
    input [3:0] outside_state,
    output [11:0] OUT,
    output [3:0] an,
    output [6:0] seg
    );
 
        localparam N = 9999; //N represents size of buffer
       
        reg [11:0] fifo [0:N-1];
        integer read = 0;
        integer write = 0;
        wire slower_clk;
        
        integer freq = 0;
        integer upper = 2000;        
        FlexiClock fc((freq + 200) * 10, CLK, slower_clk);
        
        reg [11:0] out_temp;
       
        always @(posedge slower_clk) begin 
            if (write + 1 >= N) begin
                write <= 0;  
            end else begin
                write <= write + 1;
            end
            
            if (((write + 1) % N) == read) begin
                if (read + 1 >= N) begin
                    read <= 0;
                end else begin
                    read <= read + 1;
                end
                
            end

            fifo[write] <= IN;
            out_temp <= fifo[read];
        end    
        
        wire slow_clock;
        wire up;
        wire down;
        FlexiClock fc1 (4, CLK, slow_clock);
        debounce db1 (btn[1], slow_clock, up);
        debounce db2 (btn[4], slow_clock, down);
        
        integer interval = 100;
        
        always @(posedge slow_clock) begin
            if (up && !down && (outside_state == 4'b0100)) begin
                freq <= (freq + interval > upper) ? upper : freq + interval;
            end
            
            if (down && !up && (outside_state == 4'b0100)) begin
                freq <= (freq - interval < 0) ? 0 : freq - interval;
            end
        end
                   
        assign OUT = out_temp;
        
        wire [3:0] first;
        wire [3:0] second;
        wire [3:0] third;
        wire [3:0] fourth;
        
        wire dp;

        deciToDigits dtd(freq, first, second, third, fourth);
        sevenseg ss(CLK, 0, fourth, third, second, first,
                    seg[0], seg[1], seg[2], seg[3], seg[4], seg[5], seg[6],
                    dp, an);
endmodule
