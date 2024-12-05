module font_rom (
    input wire [7:0] char_code,   // ASCII code of the character
    input wire [2:0] row,         // Row index (0-7)
    output reg [7:0] bitmap       // 8-pixel wide row of the character
);
    reg [7:0] font_memory [0:127][0:7]; // ROM for 128 ASCII characters, each 8x8
    integer i;
    initial begin
        // Initialize all characters to blanks (space character)
        for (i = 0; i < 128; i = i + 1) begin
            font_memory[i][0] = 8'b00000000;
            font_memory[i][1] = 8'b00000000;
            font_memory[i][2] = 8'b00000000;
            font_memory[i][3] = 8'b00000000;
            font_memory[i][4] = 8'b00000000;
            font_memory[i][5] = 8'b00000000;
            font_memory[i][6] = 8'b00000000;
            font_memory[i][7] = 8'b00000000;
        end

        // Uppercase Letters (ASCII 65 to 90)
        // Letter 'A' (ASCII 65)
        font_memory[65][0] = 8'b00011000;
        font_memory[65][1] = 8'b00100100;
        font_memory[65][2] = 8'b01000010;
        font_memory[65][3] = 8'b01000010;
        font_memory[65][4] = 8'b01111110;
        font_memory[65][5] = 8'b01000010;
        font_memory[65][6] = 8'b01000010;
        font_memory[65][7] = 8'b00000000;

        // Letter 'B' (ASCII 66)
        font_memory[66][0] = 8'b01111100;
        font_memory[66][1] = 8'b01000010;
        font_memory[66][2] = 8'b01000010;
        font_memory[66][3] = 8'b01111100;
        font_memory[66][4] = 8'b01000010;
        font_memory[66][5] = 8'b01000010;
        font_memory[66][6] = 8'b01111100;
        font_memory[66][7] = 8'b00000000;

        // Continue adding uppercase letters 'C' to 'Z'
        // Letter 'C' (ASCII 67)
        font_memory[67][0] = 8'b00111100;
        font_memory[67][1] = 8'b01000010;
        font_memory[67][2] = 8'b01000000;
        font_memory[67][3] = 8'b01000000;
        font_memory[67][4] = 8'b01000000;
        font_memory[67][5] = 8'b01000010;
        font_memory[67][6] = 8'b00111100;
        font_memory[67][7] = 8'b00000000;

        // Letter 'D' (ASCII 68)
        font_memory[68][0] = 8'b01111000;
        font_memory[68][1] = 8'b01000100;
        font_memory[68][2] = 8'b01000010;
        font_memory[68][3] = 8'b01000010;
        font_memory[68][4] = 8'b01000010;
        font_memory[68][5] = 8'b01000100;
        font_memory[68][6] = 8'b01111000;
        font_memory[68][7] = 8'b00000000;

        // Letter 'E' (ASCII 69)
        font_memory[69][0] = 8'b01111110;
        font_memory[69][1] = 8'b01000000;
        font_memory[69][2] = 8'b01000000;
        font_memory[69][3] = 8'b01111100;
        font_memory[69][4] = 8'b01000000;
        font_memory[69][5] = 8'b01000000;
        font_memory[69][6] = 8'b01111110;
        font_memory[69][7] = 8'b00000000;

        // Letter 'F' (ASCII 70)
        font_memory[70][0] = 8'b01111110;
        font_memory[70][1] = 8'b01000000;
        font_memory[70][2] = 8'b01000000;
        font_memory[70][3] = 8'b01111100;
        font_memory[70][4] = 8'b01000000;
        font_memory[70][5] = 8'b01000000;
        font_memory[70][6] = 8'b01000000;
        font_memory[70][7] = 8'b00000000;

        // Letter 'G' (ASCII 71)
        font_memory[71][0] = 8'b00111100;
        font_memory[71][1] = 8'b01000010;
        font_memory[71][2] = 8'b01000000;
        font_memory[71][3] = 8'b01001110;
        font_memory[71][4] = 8'b01000010;
        font_memory[71][5] = 8'b01000010;
        font_memory[71][6] = 8'b00111100;
        font_memory[71][7] = 8'b00000000;

        // Letter 'H' (ASCII 72)
        font_memory[72][0] = 8'b01000010;
        font_memory[72][1] = 8'b01000010;
        font_memory[72][2] = 8'b01000010;
        font_memory[72][3] = 8'b01111110;
        font_memory[72][4] = 8'b01000010;
        font_memory[72][5] = 8'b01000010;
        font_memory[72][6] = 8'b01000010;
        font_memory[72][7] = 8'b00000000;

        // Letter 'I' (ASCII 73)
        font_memory[73][0] = 8'b00111100;
        font_memory[73][1] = 8'b00010000;
        font_memory[73][2] = 8'b00010000;
        font_memory[73][3] = 8'b00010000;
        font_memory[73][4] = 8'b00010000;
        font_memory[73][5] = 8'b00010000;
        font_memory[73][6] = 8'b00111100;
        font_memory[73][7] = 8'b00000000;

        // Letter 'J' (ASCII 74)
        font_memory[74][0] = 8'b00011110;
        font_memory[74][1] = 8'b00001000;
        font_memory[74][2] = 8'b00001000;
        font_memory[74][3] = 8'b00001000;
        font_memory[74][4] = 8'b01001000;
        font_memory[74][5] = 8'b01001000;
        font_memory[74][6] = 8'b00110000;
        font_memory[74][7] = 8'b00000000;

        // Letter 'K' (ASCII 75)
        font_memory[75][0] = 8'b01000010;
        font_memory[75][1] = 8'b01000100;
        font_memory[75][2] = 8'b01001000;
        font_memory[75][3] = 8'b01110000;
        font_memory[75][4] = 8'b01001000;
        font_memory[75][5] = 8'b01000100;
        font_memory[75][6] = 8'b01000010;
        font_memory[75][7] = 8'b00000000;

        // Letter 'L' (ASCII 76)
        font_memory[76][0] = 8'b01000000;
        font_memory[76][1] = 8'b01000000;
        font_memory[76][2] = 8'b01000000;
        font_memory[76][3] = 8'b01000000;
        font_memory[76][4] = 8'b01000000;
        font_memory[76][5] = 8'b01000000;
        font_memory[76][6] = 8'b01111110;
        font_memory[76][7] = 8'b00000000;

        // Letter 'M' (ASCII 77)
        font_memory[77][0] = 8'b01000010;
        font_memory[77][1] = 8'b01100110;
        font_memory[77][2] = 8'b01011010;
        font_memory[77][3] = 8'b01000010;
        font_memory[77][4] = 8'b01000010;
        font_memory[77][5] = 8'b01000010;
        font_memory[77][6] = 8'b01000010;
        font_memory[77][7] = 8'b00000000;

        // Letter 'N' (ASCII 78)
        font_memory[78][0] = 8'b01000010;
        font_memory[78][1] = 8'b01100010;
        font_memory[78][2] = 8'b01010010;
        font_memory[78][3] = 8'b01001010;
        font_memory[78][4] = 8'b01000110;
        font_memory[78][5] = 8'b01000010;
        font_memory[78][6] = 8'b01000010;
        font_memory[78][7] = 8'b00000000;

        // Letter 'O' (ASCII 79)
        font_memory[79][0] = 8'b00111100;
        font_memory[79][1] = 8'b01000010;
        font_memory[79][2] = 8'b01000010;
        font_memory[79][3] = 8'b01000010;
        font_memory[79][4] = 8'b01000010;
        font_memory[79][5] = 8'b01000010;
        font_memory[79][6] = 8'b00111100;
        font_memory[79][7] = 8'b00000000;

        // Letter 'P' (ASCII 80)
        font_memory[80][0] = 8'b01111100;
        font_memory[80][1] = 8'b01000010;
        font_memory[80][2] = 8'b01000010;
        font_memory[80][3] = 8'b01111100;
        font_memory[80][4] = 8'b01000000;
        font_memory[80][5] = 8'b01000000;
        font_memory[80][6] = 8'b01000000;
        font_memory[80][7] = 8'b00000000;

        // Letter 'Q' (ASCII 81)
        font_memory[81][0] = 8'b00111100;
        font_memory[81][1] = 8'b01000010;
        font_memory[81][2] = 8'b01000010;
        font_memory[81][3] = 8'b01000010;
        font_memory[81][4] = 8'b01001010;
        font_memory[81][5] = 8'b01000100;
        font_memory[81][6] = 8'b00111010;
        font_memory[81][7] = 8'b00000000;

        // Letter 'R' (ASCII 82)
        font_memory[82][0] = 8'b01111100;
        font_memory[82][1] = 8'b01000010;
        font_memory[82][2] = 8'b01000010;
        font_memory[82][3] = 8'b01111100;
        font_memory[82][4] = 8'b01001000;
        font_memory[82][5] = 8'b01000100;
        font_memory[82][6] = 8'b01000010;
        font_memory[82][7] = 8'b00000000;

        // Letter 'S' (ASCII 83)
        font_memory[83][0] = 8'b00111100;
        font_memory[83][1] = 8'b01000010;
        font_memory[83][2] = 8'b01000000;
        font_memory[83][3] = 8'b00111100;
        font_memory[83][4] = 8'b00000010;
        font_memory[83][5] = 8'b01000010;
        font_memory[83][6] = 8'b00111100;
        font_memory[83][7] = 8'b00000000;

        // Letter 'T' (ASCII 84)
        font_memory[84][0] = 8'b01111110;
        font_memory[84][1] = 8'b00010000;
        font_memory[84][2] = 8'b00010000;
        font_memory[84][3] = 8'b00010000;
        font_memory[84][4] = 8'b00010000;
        font_memory[84][5] = 8'b00010000;
        font_memory[84][6] = 8'b00010000;
        font_memory[84][7] = 8'b00000000;

        // Letter 'U' (ASCII 85)
        font_memory[85][0] = 8'b01000010;
        font_memory[85][1] = 8'b01000010;
        font_memory[85][2] = 8'b01000010;
        font_memory[85][3] = 8'b01000010;
        font_memory[85][4] = 8'b01000010;
        font_memory[85][5] = 8'b01000010;
        font_memory[85][6] = 8'b00111100;
        font_memory[85][7] = 8'b00000000;

        // Letter 'V' (ASCII 86)
        font_memory[86][0] = 8'b01000010;
        font_memory[86][1] = 8'b01000010;
        font_memory[86][2] = 8'b01000010;
        font_memory[86][3] = 8'b01000010;
        font_memory[86][4] = 8'b01000010;
        font_memory[86][5] = 8'b00100100;
        font_memory[86][6] = 8'b00011000;
        font_memory[86][7] = 8'b00000000;

        // Letter 'W' (ASCII 87)
        font_memory[87][0] = 8'b01000010;
        font_memory[87][1] = 8'b01000010;
        font_memory[87][2] = 8'b01000010;
        font_memory[87][3] = 8'b01011010;
        font_memory[87][4] = 8'b01011010;
        font_memory[87][5] = 8'b01011010;
        font_memory[87][6] = 8'b00100100;
        font_memory[87][7] = 8'b00000000;

        // Letter 'X' (ASCII 88)
        font_memory[88][0] = 8'b01000010;
        font_memory[88][1] = 8'b00100100;
        font_memory[88][2] = 8'b00011000;
        font_memory[88][3] = 8'b00011000;
        font_memory[88][4] = 8'b00011000;
        font_memory[88][5] = 8'b00100100;
        font_memory[88][6] = 8'b01000010;
        font_memory[88][7] = 8'b00000000;

        // Letter 'Y' (ASCII 89)
        font_memory[89][0] = 8'b01000010;
        font_memory[89][1] = 8'b00100100;
        font_memory[89][2] = 8'b00011000;
        font_memory[89][3] = 8'b00010000;
        font_memory[89][4] = 8'b00010000;
        font_memory[89][5] = 8'b00010000;
        font_memory[89][6] = 8'b00010000;
        font_memory[89][7] = 8'b00000000;

        // Letter 'Z' (ASCII 90)
        font_memory[90][0] = 8'b01111110;
        font_memory[90][1] = 8'b00000100;
        font_memory[90][2] = 8'b00001000;
        font_memory[90][3] = 8'b00010000;
        font_memory[90][4] = 8'b00100000;
        font_memory[90][5] = 8'b01000000;
        font_memory[90][6] = 8'b01111110;
        font_memory[90][7] = 8'b00000000;

        // Lowercase Letters (ASCII 97 to 122)
        // Letter 'a' (ASCII 97)
        font_memory[97][0] = 8'b00000000;
        font_memory[97][1] = 8'b00000000;
        font_memory[97][2] = 8'b00111100;
        font_memory[97][3] = 8'b00000010;
        font_memory[97][4] = 8'b00111110;
        font_memory[97][5] = 8'b01000010;
        font_memory[97][6] = 8'b00111110;
        font_memory[97][7] = 8'b00000000;

        // Letter 'b' (ASCII 98)
        font_memory[98][0] = 8'b01000000;
        font_memory[98][1] = 8'b01000000;
        font_memory[98][2] = 8'b01111000;
        font_memory[98][3] = 8'b01000100;
        font_memory[98][4] = 8'b01000010;
        font_memory[98][5] = 8'b01000010;
        font_memory[98][6] = 8'b01111100;
        font_memory[98][7] = 8'b00000000;

        // Continue adding lowercase letters 'c' to 'z'

        // Letter 'c' (ASCII 99)
        font_memory[99][0] = 8'b00000000;
        font_memory[99][1] = 8'b00000000;
        font_memory[99][2] = 8'b00111100;
        font_memory[99][3] = 8'b01000010;
        font_memory[99][4] = 8'b01000000;
        font_memory[99][5] = 8'b01000010;
        font_memory[99][6] = 8'b00111100;
        font_memory[99][7] = 8'b00000000;

        // Letter 'd' (ASCII 100)
        font_memory[100][0] = 8'b00000010;
        font_memory[100][1] = 8'b00000010;
        font_memory[100][2] = 8'b00111110;
        font_memory[100][3] = 8'b01000010;
        font_memory[100][4] = 8'b01000010;
        font_memory[100][5] = 8'b01000110;
        font_memory[100][6] = 8'b00111010;
        font_memory[100][7] = 8'b00000000;

        // Letter 'e' (ASCII 101)
        font_memory[101][0] = 8'b00000000;
        font_memory[101][1] = 8'b00000000;
        font_memory[101][2] = 8'b00111100;
        font_memory[101][3] = 8'b01000010;
        font_memory[101][4] = 8'b01111110;
        font_memory[101][5] = 8'b01000000;
        font_memory[101][6] = 8'b00111100;
        font_memory[101][7] = 8'b00000000;

        // Letter 'f' (ASCII 102)
        font_memory[102][0] = 8'b00001100;
        font_memory[102][1] = 8'b00010010;
        font_memory[102][2] = 8'b00010000;
        font_memory[102][3] = 8'b00111100;
        font_memory[102][4] = 8'b00010000;
        font_memory[102][5] = 8'b00010000;
        font_memory[102][6] = 8'b00010000;
        font_memory[102][7] = 8'b00000000;

        // Letter 'g' (ASCII 103)
        font_memory[103][0] = 8'b00000000;
        font_memory[103][1] = 8'b00000000;
        font_memory[103][2] = 8'b00111010;
        font_memory[103][3] = 8'b01000110;
        font_memory[103][4] = 8'b01000010;
        font_memory[103][5] = 8'b00111110;
        font_memory[103][6] = 8'b00000010;
        font_memory[103][7] = 8'b00111100;

        // Letter 'h' (ASCII 104)
        font_memory[104][0] = 8'b01000000;
        font_memory[104][1] = 8'b01000000;
        font_memory[104][2] = 8'b01111000;
        font_memory[104][3] = 8'b01000100;
        font_memory[104][4] = 8'b01000010;
        font_memory[104][5] = 8'b01000010;
        font_memory[104][6] = 8'b01000010;
        font_memory[104][7] = 8'b00000000;

        // Letter 'i' (ASCII 105)
        font_memory[105][0] = 8'b00010000;
        font_memory[105][1] = 8'b00000000;
        font_memory[105][2] = 8'b00110000;
        font_memory[105][3] = 8'b00010000;
        font_memory[105][4] = 8'b00010000;
        font_memory[105][5] = 8'b00010000;
        font_memory[105][6] = 8'b00111000;
        font_memory[105][7] = 8'b00000000;

        // Letter 'j' (ASCII 106)
        font_memory[106][0] = 8'b00000100;
        font_memory[106][1] = 8'b00000000;
        font_memory[106][2] = 8'b00001100;
        font_memory[106][3] = 8'b00000100;
        font_memory[106][4] = 8'b00000100;
        font_memory[106][5] = 8'b01000100;
        font_memory[106][6] = 8'b01000100;
        font_memory[106][7] = 8'b00111000;

        // Letter 'k' (ASCII 107)
        font_memory[107][0] = 8'b01000000;
        font_memory[107][1] = 8'b01000000;
        font_memory[107][2] = 8'b01000100;
        font_memory[107][3] = 8'b01001000;
        font_memory[107][4] = 8'b01110000;
        font_memory[107][5] = 8'b01001000;
        font_memory[107][6] = 8'b01000100;
        font_memory[107][7] = 8'b00000000;

        // Letter 'l' (ASCII 108)
        font_memory[108][0] = 8'b00110000;
        font_memory[108][1] = 8'b00010000;
        font_memory[108][2] = 8'b00010000;
        font_memory[108][3] = 8'b00010000;
        font_memory[108][4] = 8'b00010000;
        font_memory[108][5] = 8'b00010000;
        font_memory[108][6] = 8'b00111000;
        font_memory[108][7] = 8'b00000000;

        // Letter 'm' (ASCII 109)
        font_memory[109][0] = 8'b00000000;
        font_memory[109][1] = 8'b00000000;
        font_memory[109][2] = 8'b01100100;
        font_memory[109][3] = 8'b01011010;
        font_memory[109][4] = 8'b01000010;
        font_memory[109][5] = 8'b01000010;
        font_memory[109][6] = 8'b01000010;
        font_memory[109][7] = 8'b00000000;

        // Letter 'n' (ASCII 110)
        font_memory[110][0] = 8'b00000000;
        font_memory[110][1] = 8'b00000000;
        font_memory[110][2] = 8'b01111000;
        font_memory[110][3] = 8'b01000100;
        font_memory[110][4] = 8'b01000010;
        font_memory[110][5] = 8'b01000010;
        font_memory[110][6] = 8'b01000010;
        font_memory[110][7] = 8'b00000000;

        // Letter 'o' (ASCII 111)
        font_memory[111][0] = 8'b00000000;
        font_memory[111][1] = 8'b00000000;
        font_memory[111][2] = 8'b00111100;
        font_memory[111][3] = 8'b01000010;
        font_memory[111][4] = 8'b01000010;
        font_memory[111][5] = 8'b01000010;
        font_memory[111][6] = 8'b00111100;
        font_memory[111][7] = 8'b00000000;
        
        font_memory[112][0] = 8'b00000000;
        font_memory[112][1] = 8'b00000000;
        font_memory[112][2] = 8'b01111100;
        font_memory[112][3] = 8'b01000010;
        font_memory[112][4] = 8'b01000010;
        font_memory[112][5] = 8'b01111100;
        font_memory[112][6] = 8'b01000000;
        font_memory[112][7] = 8'b01000000;

        // Letter 'q' (ASCII 113)
        font_memory[113][0] = 8'b00000000;
        font_memory[113][1] = 8'b00000000;
        font_memory[113][2] = 8'b00111110;
        font_memory[113][3] = 8'b01000010;
        font_memory[113][4] = 8'b01000010;
        font_memory[113][5] = 8'b00111110;
        font_memory[113][6] = 8'b00000010;
        font_memory[113][7] = 8'b00000010;

        // Letter 'r' (ASCII 114)
        font_memory[114][0] = 8'b00000000;
        font_memory[114][1] = 8'b00000000;
        font_memory[114][2] = 8'b01011100;
        font_memory[114][3] = 8'b01100010;
        font_memory[114][4] = 8'b01000000;
        font_memory[114][5] = 8'b01000000;
        font_memory[114][6] = 8'b01000000;
        font_memory[114][7] = 8'b00000000;

        // Letter 's' (ASCII 115)
        font_memory[115][0] = 8'b00000000;
        font_memory[115][1] = 8'b00000000;
        font_memory[115][2] = 8'b00111110;
        font_memory[115][3] = 8'b01000000;
        font_memory[115][4] = 8'b00111100;
        font_memory[115][5] = 8'b00000010;
        font_memory[115][6] = 8'b01111100;
        font_memory[115][7] = 8'b00000000;

        // Letter 't' (ASCII 116)
        font_memory[116][0] = 8'b00010000;
        font_memory[116][1] = 8'b00010000;
        font_memory[116][2] = 8'b01111100;
        font_memory[116][3] = 8'b00010000;
        font_memory[116][4] = 8'b00010000;
        font_memory[116][5] = 8'b00010010;
        font_memory[116][6] = 8'b00001100;
        font_memory[116][7] = 8'b00000000;

        // Letter 'u' (ASCII 117)
        font_memory[117][0] = 8'b00000000;
        font_memory[117][1] = 8'b00000000;
        font_memory[117][2] = 8'b01000010;
        font_memory[117][3] = 8'b01000010;
        font_memory[117][4] = 8'b01000010;
        font_memory[117][5] = 8'b01000110;
        font_memory[117][6] = 8'b00111010;
        font_memory[117][7] = 8'b00000000;

        // Letter 'v' (ASCII 118)
        font_memory[118][0] = 8'b00000000;
        font_memory[118][1] = 8'b00000000;
        font_memory[118][2] = 8'b01000010;
        font_memory[118][3] = 8'b01000010;
        font_memory[118][4] = 8'b01000010;
        font_memory[118][5] = 8'b00100100;
        font_memory[118][6] = 8'b00011000;
        font_memory[118][7] = 8'b00000000;

        // Letter 'w' (ASCII 119)
        font_memory[119][0] = 8'b00000000;
        font_memory[119][1] = 8'b00000000;
        font_memory[119][2] = 8'b01000010;
        font_memory[119][3] = 8'b01000010;
        font_memory[119][4] = 8'b01011010;
        font_memory[119][5] = 8'b01011010;
        font_memory[119][6] = 8'b00100100;
        font_memory[119][7] = 8'b00000000;

        // Letter 'x' (ASCII 120)
        font_memory[120][0] = 8'b00000000;
        font_memory[120][1] = 8'b00000000;
        font_memory[120][2] = 8'b01000010;
        font_memory[120][3] = 8'b00100100;
        font_memory[120][4] = 8'b00011000;
        font_memory[120][5] = 8'b00100100;
        font_memory[120][6] = 8'b01000010;
        font_memory[120][7] = 8'b00000000;

        // Letter 'y' (ASCII 121)
        font_memory[121][0] = 8'b00000000;
        font_memory[121][1] = 8'b00000000;
        font_memory[121][2] = 8'b01000010;
        font_memory[121][3] = 8'b01000010;
        font_memory[121][4] = 8'b01000010;
        font_memory[121][5] = 8'b00111110;
        font_memory[121][6] = 8'b00000010;
        font_memory[121][7] = 8'b00111100;

        // Letter 'z' (ASCII 122)
        font_memory[122][0] = 8'b00000000;
        font_memory[122][1] = 8'b00000000;
        font_memory[122][2] = 8'b01111110;
        font_memory[122][3] = 8'b00000100;
        font_memory[122][4] = 8'b00001000;
        font_memory[122][5] = 8'b00010000;
        font_memory[122][6] = 8'b01111110;
        font_memory[122][7] = 8'b00000000;

        // Letter 'l' (ASCII 108) [For completeness]
        font_memory[108][0] = 8'b00010000;
        font_memory[108][1] = 8'b00010000;
        font_memory[108][2] = 8'b00010000;
        font_memory[108][3] = 8'b00010000;
        font_memory[108][4] = 8'b00010000;
        font_memory[108][5] = 8'b00010000;
        font_memory[108][6] = 8'b00001100;
        font_memory[108][7] = 8'b00000000;

        // Letter 'e' (ASCII 101) [Already included, but highlighting for 'left']
        font_memory[101][0] = 8'b00000000;
        font_memory[101][1] = 8'b00000000;
        font_memory[101][2] = 8'b00111100;
        font_memory[101][3] = 8'b01000010;
        font_memory[101][4] = 8'b01111110;
        font_memory[101][5] = 8'b01000000;
        font_memory[101][6] = 8'b00111100;
        font_memory[101][7] = 8'b00000000;

        // Letter 'f' (ASCII 102) [Already included, but highlighting for 'left']
        font_memory[102][0] = 8'b00001100;
        font_memory[102][1] = 8'b00010010;
        font_memory[102][2] = 8'b00010000;
        font_memory[102][3] = 8'b00111100;
        font_memory[102][4] = 8'b00010000;
        font_memory[102][5] = 8'b00010000;
        font_memory[102][6] = 8'b00010000;
        font_memory[102][7] = 8'b00000000;

        // Letter 't' (ASCII 116) [Already included, but highlighting for 'left']
        font_memory[116][0] = 8'b00010000;
        font_memory[116][1] = 8'b00010000;
        font_memory[116][2] = 8'b01111100;
        font_memory[116][3] = 8'b00010000;
        font_memory[116][4] = 8'b00010000;
        font_memory[116][5] = 8'b00010010;
        font_memory[116][6] = 8'b00001100;
        font_memory[116][7] = 8'b00000000;

        // Continue adding letters 'p' to 'z'...

        // You can continue to fill in the rest of the lowercase letters
        // using similar patterns for their bitmaps.

        // Note: For brevity, the entire set of letters is not included here.
        // You should add the rest of the lowercase letters 'p' to 'z' (ASCII 112 to 122)
        // following the same structure as above.
    end

    always @(*) begin
        bitmap = font_memory[char_code][row];
    end
endmodule
