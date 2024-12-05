module hexTo7Segment (
    output reg [6:0] segments, 
    input [7:0] hex           
);

always @(hex) begin
    case (hex)
        8'h41, 8'h61: segments = 7'b0100000; // A/a
        8'h42, 8'h62: segments = 7'b0000011; // B/b
        8'h43, 8'h63: segments = 7'b0100111; // C/c
        8'h44, 8'h64: segments = 7'b0100001; // D/d
        8'h45, 8'h65: segments = 7'b0000110; // E/e
        8'h46, 8'h66: segments = 7'b0001110; // F/f
        8'h47, 8'h67: segments = 7'b1000010; // G/g
        8'h48, 8'h68: segments = 7'b0001011; // H/h
        8'h49, 8'h69: segments = 7'b1101110; // I/i
        8'h4A, 8'h6A: segments = 7'b1110010; // J/j
        8'h4B, 8'h6B: segments = 7'b0001010; // K/k
        8'h4C, 8'h6C: segments = 7'b1000111; // L/l
        8'h4D, 8'h6D: segments = 7'b0101010; // M/m
        8'h4E, 8'h6E: segments = 7'b0101011; // N/n
        8'h4F, 8'h6F: segments = 7'b0100011; // O/o
        8'h50, 8'h70: segments = 7'b0001100; // P/p
        8'h51, 8'h71: segments = 7'b0011000; // Q/q
        8'h52, 8'h72: segments = 7'b0101111; // R/r
        8'h53, 8'h73: segments = 7'b1010010; // S/s
        8'h54, 8'h74: segments = 7'b0000111; // T/t
        8'h55, 8'h75: segments = 7'b1100011; // U/u
        8'h56, 8'h76: segments = 7'b1010101; // V/v
        8'h57, 8'h77: segments = 7'b0010101; // W/w
        8'h58, 8'h78: segments = 7'b1101011; // X/x
        8'h59, 8'h79: segments = 7'b0010001; // Y/y
        8'h5A, 8'h7A: segments = 7'b1100100; // Z/z
        8'h40: segments = 7'b1101000;       // @
        8'h31: segments = 7'b1111001;       // 1
        8'h32: segments = 7'b0100100;       // 2
        8'h33: segments = 7'b0110000;       // 3
        8'h34: segments = 7'b0011001;       // 4
        8'h35: segments = 7'b0010010;       // 5
        8'h36: segments = 7'b0000010;       // 6
        8'h37: segments = 7'b1111000;       // 7
        8'h38: segments = 7'b0000000;       // 8
        8'h39: segments = 7'b0010000;       // 9
        8'h30: segments = 7'b1000000;       // 0
        8'h25: segments = 7'b1011011;       // %
        8'h2E: segments = 7'b1101111;       // .
        8'h2C: segments = 7'b1110011;       // ,
        8'h3B: segments = 7'b1110101;       // ;
        8'h3A: segments = 7'b1110110;       // :
        8'h2B: segments = 7'b0111001;       // +
        8'h2D: segments = 7'b0111111;       // -
        8'h3D: segments = 7'b0110111;       // =
        8'h2A: segments = 7'b0110110;       // *
        8'h23: segments = 7'b1001001;       // #
        8'h21: segments = 7'b0010100;       // !
        8'h3F: segments = 7'b0110100;       // ?
        8'h5F: segments = 7'b1110111;       // _
        8'h27: segments = 7'b1011111;       // '
        8'h22: segments = 7'b1011101;       // "
        8'h3C: segments = 7'b1011110;       // <
        8'h3E: segments = 7'b1111100;       // >
        8'h5C: segments = 7'b0101101;       // \
        8'h2F: segments = 7'b0011011;       // /
        8'h28: segments = 7'b1000110;       // (
        8'h29: segments = 7'b1110000;       // )
        default: segments = 7'b0111111;     // 
    endcase
end

endmodule
