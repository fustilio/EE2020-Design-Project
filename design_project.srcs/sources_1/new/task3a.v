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


module task3a(
    input [11:0] IN,
    input clk, // assume 10kHz
    output [11:0] OUT
    );
       // for clk duration is 1/10000 seconds, we need 0.25 * 10000 ticks 
       localparam N = 2500; //N represents size of buffer
       
       reg [11:0] fifo [0:N-1];
       integer i;
       
       always @(posedge clk) begin
           fifo[0] = IN; // push new value to fifo
           // push all values 1 step
           for (i=1; i<=N-1; i=i+1) begin
               fifo[i] <= fifo[i-1];
           end
       end    
       
       assign OUT = fifo[N-1];
endmodule
