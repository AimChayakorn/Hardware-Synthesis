`timescale 1ns / 1ps



module system(
    input wire [7:0]sw, 
    input btnC,
    input btnU,
    output wire RsTx, //uart
    input wire RsRx, //uart
    input clk,
    output [6:0] seg,
    output dp,
    output [3:0] an,
    inout wire [7:0] JB,
    output wire Hsync,            // Horizontal sync for VGA
    output wire Vsync,            // Vertical sync for VGA
    output wire [3:0] vgaRed,    // VGA red signal (4 bits)
    output wire [3:0] vgaGreen,  // VGA green signal (4 bits)
    output wire [3:0] vgaBlue    // VGA blue signal (4 bits)
    );
    reg reset;
    initial begin
    reset = 0;
    end
    assign JB[0] = 1'bz;        // High-Z for JB[0] (input mode)
    assign RsRx_b = JB[0];
    assign RsTx_b = JB[3];
    wire targetClk;
    wire [18:0] tclk;
    assign tclk[0]=clk;
    genvar c;
    generate for(c=0;c<18;c=c+1) begin
        clockDiv fDiv(tclk[c+1],tclk[c]);
    end endgenerate
    
    clockDiv fdivTarget(targetClk,tclk[18]);
    
    
    wire[7:0] char0,char1,char2,char3;
    reg [7:0] data_kb, data_b;
    assign {char1,char0} = data_kb;
    reg push;
//    assign char1 = data_sw;
    assign {char3,char2} = data_b;
    wire an0,an1,an2,an3;
    assign an={an3,an2,an1,an0};
    quadSevenSeg q7seg(seg,dp,an0,an1,an2,an3,char0,char1,char2,char3,targetClk);
    
    reg en_k,en_b, ps_kb, ps_b;
    reg [7:0] data_send_keyboard;
    reg [7:0] data_send_board;
    wire [7:0] data_receive_board;
    wire [7:0] data_receive_keyboard;
    wire sent_board,sent_keyboard, received_board,received_keyboard, baud;
    clockCounter cl(clk, baud);
    uart_rx receiver(baud, RsRx, received_keyboard, data_receive_keyboard);
    uart_tx transmitter(baud, data_send_keyboard, en_k, sent_keyboard, RsTx);
    
    uart_rx receiver_board(baud, RsRx_b, received_board, data_receive_board);
    uart_tx transmitter_board(baud, data_send_board, en_b, sent_board,RsTx_b);
    reg [7:0] data;

     always @(posedge baud) begin
        if (en_k|en_b) begin en_k <= 0; en_b <= 0; end
        if (~ps_b&received_board) begin //receive from board
                data_send_keyboard <= data_receive_board;
                data_b <= data_receive_board;
                data <= data_receive_board;
                en_k <= 1;
        end
        if (~ps_kb& received_keyboard) begin //receive from kb
                data_send_board <= data_receive_keyboard;
//                data_send_keyboard <= data_receive_keyboard;
                data_kb <= data_receive_keyboard;
                data <= data_receive_keyboard;
                en_b <= 1;
//                en_k <= 1;
        end
        if (~push & btnC) begin
            en_b <=1;
            en_k <=1;
            data_kb <= sw[7:0];
            data_send_keyboard <= sw[7:0];
            data_send_board <= sw[7:0];
            data <= sw[7:0];
            push <= 1;
        end
        if (~btnC) push <= 0;
        ps_kb <= received_keyboard;
        ps_b <= received_board;
        
        if(~btnU) reset<=1;
        if (btnU & reset) reset <= 0;
    end
    wire clk_25mhz;

    // VGA display module
    
    wire write_en;
    assign write_en = en_k;

    vga vga_display (
        .clk(clk),
        .reset(reset),
        .data(data),
        .write_en(write_en),
        .hsync(Hsync),
        .vsync(Vsync),
        .red(vgaRed),
        .green(vgaGreen),
        .blue(vgaBlue)
    );
endmodule
