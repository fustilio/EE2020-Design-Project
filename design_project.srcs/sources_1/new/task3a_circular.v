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
    output [11:0] OUT
    );
 
        localparam N = 2500; //N represents size of buffer
       
        reg [11:0] fifo [0:N-1];
        integer read = 0;
        integer write = 0;
        wire slower_clk;
        
        
        FlexiClock fc(10000, CLK, slower_clk);
        
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
       
        assign OUT = out_temp;
endmodule
