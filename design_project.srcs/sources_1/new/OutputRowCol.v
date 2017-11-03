`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2017 02:44:50
// Design Name: 
// Module Name: OutputRowCol
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


module OutputRowCol(
    input CLK,
    input reset,
    input [3:0] in0, 
    input [3:0] in1, 
    input [3:0] in2, 
    input [3:0] in3,
    output [7:0] row,
    output [3:0] col
    );
    
    localparam N = 18;
     
    reg [N-1:0]count; //the 18 bit counter which allows us to multiplex at 1000Hz
     
    always @ (posedge CLK or posedge reset)
     begin
      if (reset)
       count <= 0;
      else
       count <= count + 1;
     end
     
    reg [3:0]col_count; //the 7 bit register to hold the data to output
    reg [3:0]col_temp; //register for the 4 bit enable
     
    always @ (*)
     begin
      case(count[N-1:N-2]) //using only the 2 MSB's of the counter 
        
       2'b00 :  //When the 2 MSB's are 00 enable the fourth display
        begin
         col_count = in0;
         col_temp = 4'b0001;
        end
        
       2'b01:  //When the 2 MSB's are 01 enable the third display
        begin
         col_count = in1;
         col_temp = 4'b0010;
        end
        
       2'b10:  //When the 2 MSB's are 10 enable the second display
        begin
         col_count = in2;
         col_temp = 4'b0100;
        end
         
       2'b11:  //When the 2 MSB's are 11 enable the first display
        begin
         col_count = in3;
         col_temp = 4'b1000;
        end
      endcase
     end
     
    reg [7:0] row_temp;
     
    always @ (*)
     begin
      case(col_count)
       4'd0 : row_temp = 8'b01111111; //to display 0
       4'd1 : row_temp = 8'b10111111; //to display 1
       4'd2 : row_temp = 8'b11011111; //to display 2
       4'd3 : row_temp = 8'b11101111; //to display 3
       4'd4 : row_temp = 8'b11110111; //to display 4
       4'd5 : row_temp = 8'b11111011; //to display 5
       4'd6 : row_temp = 8'b11111101; //to display 6
       4'd7 : row_temp = 8'b11111110; //to display 7
//       4'd8 : sseg_temp = 7'b0000000; //to display 8
//       4'd9 : sseg_temp = 7'b0010000; //to display 9
       default : row_temp = 8'b11111111; //dash
      endcase
     end
    assign row = row_temp;
    assign col = col_temp;
    // I could have done in the case statement: 4'd0 : {g, f, e, d, c, b, a} = 7'b1000000; 
    // its the same thing.. write however you like it
    
endmodule