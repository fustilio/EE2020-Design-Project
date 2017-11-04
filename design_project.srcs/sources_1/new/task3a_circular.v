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
    input clk, // assume 100MHz
    output [11:0] OUT
    );
       // for clk duration is 1/10000 seconds, we need 0.25 * 10000 ticks 
        localparam N = 2500; //N represents size of buffer
         
       
        reg [11:0] fifo [0:N-1];
        integer size;
        integer read = 0;
        integer write = 1;
        integer i;
        
        reg [11:0] out_temp;
       
        always @(posedge clk) begin
            fifo[write] <= IN;
            write <= (write + 1);
            if (size == N) begin
                out_temp <= fifo[read];
                write <= (write + 1) % N;
                read <= (read + 1) % N;
            end else begin
                size <= size + 1;
            end
            
            for (i=1; i<=N-1; i=i+1) begin
               fifo[i] <= fifo[i-1];             
            end
               
        end    
       
        assign OUT = out_temp;
endmodule
