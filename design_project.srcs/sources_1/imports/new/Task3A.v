`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2017 03:20:46 PM
// Design Name: 
// Module Name: Task3A
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


module Task3A(
    input [11:0] IN,
    input clk, // assume 100Hz
    output [11:0] OUT
    );
    
    // for clk duration is 1/100000 seconds, we need 0.25 * 100000 ticks 
    localparam N = 25000; //N represents size of buffer
    
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
