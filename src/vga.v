`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 02:43:20 PM
// Design Name: 
// Module Name: vga
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


module vga (
    input wire clk,          // 25 MHz clock
    input wire reset,        // Reset signal
    input wire [7:0] data,   // Data input
    input wire write_en,     // Write enable
    output wire hsync,       // Horizontal sync
    output wire vsync,       // Vertical sync
    output reg [3:0] red,    // Red color intensity
    output reg [3:0] green,  // Green color intensity
    output reg [3:0] blue    // Blue color intensity
);

    // VGA parameters
    localparam H_DISPLAY = 640, V_DISPLAY = 480;
    localparam CELL_SIZE = 8;

    // VGA controller signals
    wire video_on;
    wire [9:0] h_counter, v_counter;
    reg ps_write_en;
    initial begin assign ps_write_en = 1; end
    vga_controller vga_ctrl (
        .clk(clk),
        .reset(reset),
        .hsync(hsync),
        .vsync(vsync),
        .video_on(video_on),
        .x(h_counter),
        .y(v_counter)
    );

    // Character display parameters
    reg [7:0] text_buffer[0:4799]; // 80x60 character grid    
    reg [7:0] current_char;
    wire [7:0] bitmap;
    wire [2:0] row = v_counter[2:0];
    wire [2:0] col_bit = h_counter[2:0];
    reg pixel_on;
    
    integer i=0; //row
    integer j=0; //column
    integer x=0;
    integer y =0;
    always @(posedge clk) begin
        if (reset) begin
            for (x = 0; x < 80; x = x + 1) begin
                for (y = 0; y < 60; y = y + 1) begin
                    text_buffer[x][y] <= 8'b0;
                end
            end
            i <= 0;
            j <= 0;
        end else if (write_en & ~ps_write_en) begin
            text_buffer[i][j] <= data;
            if (data == "\r" || data == "\n") begin
                i <= 0;
                if (j == 59) begin
                    j <= 0;
                end else begin
                    j <= j + 1;
                end
            end else if (i == 79) begin
                i <= 0;
                if (j == 59) begin
                    j <= 0;
                end else begin
                    j <= j + 1;
                end
            end else begin
                i <= i + 1;
            end
        end
        ps_write_en <= write_en;
    end


    // Font ROM instantiation
    font_rom font (
        .char_code(current_char),
        .row(row),
        .bitmap(bitmap)
    );

    // Character cell indices
    wire [9:0] char_x = h_counter / CELL_SIZE;
    wire [9:0] char_y = v_counter / CELL_SIZE;

    // Display logic
    always @(posedge clk) begin
        if (video_on) begin
            current_char <= text_buffer[char_x][char_y];
            pixel_on <= bitmap[7 - col_bit];
            red <= (pixel_on) ? 4'hF : 4'h0;
            green <= (pixel_on) ? 4'hF : 4'h0;
            blue <= (pixel_on) ? 4'hF : 4'h0;
        end else begin
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
        end
    end

endmodule
