`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2017 16:25:03
// Design Name: 
// Module Name: get_frequency_from_m_sim
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


module get_frequency_from_m_sim(

    );
    reg [31:0]M;
    reg CLK;
    wire FINAL_CLK;
    
    get_frequency_from_m getf(M,CLK,FINAL_CLK);
    
    initial begin 
    CLK = 0; #20;
    end
    
    always begin 
    #5 CLK = ~CLK;
    end
    
    initial begin 
    M = 1; #1000;
    M = 2; #1000;
    M = 3; #1000;
    M = 4; #1000;
    M = 5; #1000;
    M = 6; #1000;
    end
    endmodule
