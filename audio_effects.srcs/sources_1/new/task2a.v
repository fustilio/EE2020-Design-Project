`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2017 20:17:50
// Design Name: 
// Module Name: task2a
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


module task2a(
    input CLK,
    input [11:0] sw,
    input [4:0] btn,
    output [15:0] led,
    output [3:0] an,
    output [6:0] seg,
    output dp,
    output [11:0] speaker_out
    );
    
    integer period = 256;
    
    wire [11:0] C4;
    wire [11:0] D4;
    wire [11:0] E4;
    wire [11:0] F4;
    wire [11:0] G4;
    
//    wire [11:0] NOTE_B0 = 31; generateSine gs1 (NOTE_B0, CLK, B0); 
//    wire [11:0] NOTE_C1 = 33; generateSine gs2 (NOTE_, CLK, C1);
//    wire [11:0] NOTE_CS1 = 35; generateSine gs3 (NOTE_CS1, CLK, CS1);
//    wire [11:0] NOTE_D1 = 37; generateSine gs4 (NOTE_D1, CLK, D1);
//    wire [11:0] NOTE_DS1 = 39; generateSine gs5 (NOTE_DS1, CLK, DS1);
//    wire [11:0] NOTE_E1 = 41; generateSine gs6 (NOTE_E1, CLK, E1);
//    wire [11:0] NOTE_F1 = 44; generateSine gs7 (NOTE_F1, CLK, F1);
//    wire [11:0] NOTE_FS1 = 46; generateSine gs8 (NOTE_FS1, CLK, FS1);
//    wire [11:0] NOTE_G1 = 49; generateSine gs9 (NOTE_G1, CLK, G1);
//    wire [11:0] NOTE_GS1 = 52; generateSine gs10 (NOTE_GS1, CLK, GS1);
//    wire [11:0] NOTE_A1 = 55; generateSine gs11 (NOTE_A1, CLK, A1);
//    wire [11:0] NOTE_AS1 = 58; generateSine gs12 (NOTE_AS1, CLK, AS1);
//    wire [11:0] NOTE_B1 = 62; generateSine gs13 (NOTE_B1, CLK, B1);
//    wire [11:0] NOTE_C2 = 65; generateSine gs14 (NOTE_C2, CLK, C2);
//    wire [11:0] NOTE_CS2 = 69; generateSine gs15 (NOTE_CS2, CLK, CS2);
//    wire [11:0] NOTE_D2 = 73; generateSine gs16 (NOTE_D2, CLK, D2);
//    wire [11:0] NOTE_DS2 = 78; generateSine gs17 (NOTE_DS2, CLK, DS2);
//    wire [11:0] NOTE_E2 = 82; generateSine gs18 (NOTE_E2, CLK, E2);
//    wire [11:0] NOTE_F2 = 87; generateSine gs19 (NOTE_F2, CLK, F2);
//    wire [11:0] NOTE_FS2 = 93; generateSine gs20 (NOTE_FS2, CLK, FS2);
//    wire [11:0] NOTE_G2 = 98; generateSine gs21 (NOTE_G2, CLK, G2);
//    wire [11:0] NOTE_GS2 = 104; generateSine gs22 (NOTE_GS2, CLK, GS2);
//    wire [11:0] NOTE_A2 = 110; generateSine gs23 (NOTE_A2, CLK, A2);
//    wire [11:0] NOTE_AS2 = 117; generateSine gs24 (NOTE_AS2, CLK, AS2);
//    wire [11:0] NOTE_B2 = 123; generateSine gs25 (NOTE_B2, CLK, B2);
//    wire [11:0] NOTE_C3 = 131; generateSine gs26 (NOTE_C3, CLK, C3);
//    wire [11:0] NOTE_CS3 = 139; generateSine gs27 (NOTE_CS3, CLK, CS3);
//    wire [11:0] NOTE_D3 = 147; generateSine gs28 (NOTE_D3, CLK, D3);
//    wire [11:0] NOTE_DS3 = 156; generateSine gs29 (NOTE_DS3, CLK, DS3);
//    wire [11:0] NOTE_E3 = 165; generateSine gs30 (NOTE_E3, CLK, E3);
//    wire [11:0] NOTE_F3 = 175; generateSine gs31 (NOTE_F3, CLK, F3);
//    wire [11:0] NOTE_FS3 = 185; generateSine gs32 (NOTE_FS3, CLK, FS3);
//    wire [11:0] NOTE_G3 = 196; generateSine gs33 (NOTE_G3, CLK, G3);
//    wire [11:0] NOTE_GS3 = 208; generateSine gs34 (NOTE_GS3, CLK, GS3);
//    wire [11:0] NOTE_A3 = 220; generateSine gs35 (NOTE_A3, CLK, A3);
//    wire [11:0] NOTE_AS3 = 233; generateSine gs36 (NOTE_AS3, CLK, AS3);
//    wire [11:0] NOTE_B3 = 247; generateSine gs37 (NOTE_B3, CLK, B3);
    wire [11:0] NOTE_C4 = 262; generateSine gs38 (NOTE_C4, CLK, C4);
//    wire [11:0] NOTE_CS4 = 277; generateSine gs39 (NOTE_CS4, CLK, CS4);
    wire [11:0] NOTE_D4 = 294; generateSine gs40 (NOTE_D4, CLK, D4);
//    wire [11:0] NOTE_DS4 = 311; generateSine gs41 (NOTE_DS4, CLK, DS4);
    wire [11:0] NOTE_E4 = 330; generateSine gs42 (NOTE_E4, CLK, E4);
    wire [11:0] NOTE_F4 = 349; generateSine gs43 (NOTE_F4, CLK, F4);
//    wire [11:0] NOTE_FS4 = 370; generateSine gs44 (NOTE_FS4, CLK, FS4);
    wire [11:0] NOTE_G4 = 392; generateSine gs45 (NOTE_G4, CLK, G4);
//    wire [11:0] NOTE_GS4 = 415; generateSine gs46 (NOTE_GS4, CLK, GS4);
//    wire [11:0] NOTE_A4 = 440; generateSine gs47 (NOTE_A4, CLK, A4);
//    wire [11:0] NOTE_AS4 = 466; generateSine gs48 (NOTE_AS4, CLK, AS4);
//    wire [11:0] NOTE_B4 = 494; generateSine gs49 (NOTE_B4, CLK, B4);
//    wire [11:0] NOTE_C5 = 523; generateSine gs50 (NOTE_C5, CLK, C5);
//    wire [11:0] NOTE_CS5 = 554; generateSine gs51 (NOTE_CS5, CLK, CS5);
//    wire [11:0] NOTE_D5 = 587; generateSine gs52 (NOTE_D5, CLK, D5);
//    wire [11:0] NOTE_DS5 = 622; generateSine gs53 (NOTE_DS5, CLK, DS5);
//    wire [11:0] NOTE_E5 = 659; generateSine gs54 (NOTE_E5, CLK, E5);
//    wire [11:0] NOTE_F5 = 698; generateSine gs55 (NOTE_F5, CLK, F5);
//    wire [11:0] NOTE_FS5 = 740; generateSine gs56 (NOTE_FS5, CLK, FS5);
//    wire [11:0] NOTE_G5 = 784; generateSine gs57 (NOTE_G5, CLK, G5);
//    wire [11:0] NOTE_GS5 = 831; generateSine gs58 (NOTE_GS5, CLK, GS5);
//    wire [11:0] NOTE_A5 = 880; generateSine gs59 (NOTE_A5, CLK, A5);
//    wire [11:0] NOTE_AS5 = 932; generateSine gs60 (NOTE_AS5, CLK, AS5);
//    wire [11:0] NOTE_B5 = 988; generateSine gs61 (NOTE_B5, CLK, B5);
//    wire [11:0] NOTE_C6 = 1047; generateSine gs62 (NOTE_C6, CLK, C6);
//    wire [11:0] NOTE_CS6 = 1109; generateSine gs63 (NOTE_CS6, CLK, CS6);
//    wire [11:0] NOTE_D6 = 1175; generateSine gs64 (NOTE_D6, CLK, D6);
//    wire [11:0] NOTE_DS6 = 1245; generateSine gs65 (NOTE_DS6, CLK, DS6);
//    wire [11:0] NOTE_E6 = 1319; generateSine gs66 (NOTE_E6, CLK, E6);
//    wire [11:0] NOTE_F6 = 1397; generateSine gs67 (NOTE_F6, CLK, F6);
//    wire [11:0] NOTE_FS6 = 1480; generateSine gs68 (NOTE_FS6, CLK, FS6);
//    wire [11:0] NOTE_G6 = 1568; generateSine gs69 (NOTE_G6, CLK, G6);
//    wire [11:0] NOTE_GS6 = 1661; generateSine gs70 (NOTE_GS6, CLK, GS6);
//    wire [11:0] NOTE_A6 = 1760; generateSine gs71 (NOTE_A6, CLK, A6);
//    wire [11:0] NOTE_AS6 = 1865; generateSine gs72 (NOTE_AS6, CLK, AS6);
//    wire [11:0] NOTE_B6 = 1976; generateSine gs73 (NOTE_B6, CLK, B6);
//    wire [11:0] NOTE_C7 = 2093; generateSine gs74 (NOTE_C7, CLK, C7);
//    wire [11:0] NOTE_CS7 = 2217; generateSine gs75 (NOTE_CS7, CLK, CS7);
//    wire [11:0] NOTE_D7 = 2349; generateSine gs76 (NOTE_D7, CLK, D7);
//    wire [11:0] NOTE_DS7 = 2489; generateSine gs77 (NOTE_DS7, CLK, DS7);
//    wire [11:0] NOTE_E7 = 2637; generateSine gs78 (NOTE_E7, CLK, E7);
//    wire [11:0] NOTE_F7 = 2794; generateSine gs79 (NOTE_F7, CLK, F7);
//    wire [11:0] NOTE_FS7 = 2960; generateSine gs80 (NOTE_FS7, CLK, FS7);
//    wire [11:0] NOTE_G7 = 3136; generateSine gs81 (NOTE_G7, CLK, G7);
//    wire [11:0] NOTE_GS7 = 3322; generateSine gs82 (NOTE_GS7, CLK, GS7);
//    wire [11:0] NOTE_A7 = 3520; generateSine gs83 (NOTE_A7, CLK, A7);
//    wire [11:0] NOTE_AS7 = 3729; generateSine gs84 (NOTE_AS7, CLK, AS7);
//    wire [11:0] NOTE_B7 = 3951; generateSine gs85 (NOTE_B7, CLK, B7);
//    wire [11:0] NOTE_C8 = 4186; generateSine gs86 (NOTE_C8, CLK, C8);
//    wire [11:0] NOTE_CS8 = 4435; generateSine gs87 (NOTE_CS8, CLK, CS8);
//    wire [11:0] NOTE_D8 = 4699; generateSine gs88 (NOTE_D8, CLK, D8);
//    wire [11:0] NOTE_DS8 = 4978; generateSine gs89 (NOTE_DS8, CLK, DS8);
    
    
    reg [11:0] inter = 0;
    reg [14:0] display = 0;
    
    always @(posedge CLK) begin  
        if (sw == 5'b00001) begin
            inter = C4;
            display = NOTE_C4;
        end else if (sw == 5'b00010) begin
            inter = D4;
            display = NOTE_D4;
        end else if (sw == 5'b00100) begin
            inter = E4;   
            display = NOTE_E4;   
        end else if (sw == 5'b01000) begin
            inter = F4;   
            display = NOTE_F4;   
        end else if (sw == 5'b10000) begin
            inter = G4;
            display = NOTE_G4;
        end else begin
            inter = 0;
            display = 0;
        end
    end

//      assign speaker_out = inter;
    
    wire [3:0] first;
    wire [3:0] second;
    wire [3:0] third;
    wire [3:0] fourth;
    
    
    wire clk100;
    wire [11:0] delayed;
    
    
    assign speaker_out = delayed;
    
    deciToDigits dtd(display, first, second, third, fourth);
    sevenseg ss(CLK, 0, fourth, third, second, first,
                seg[0], seg[1], seg[2], seg[3], seg[4], seg[5], seg[6],
                dp, an);
endmodule
