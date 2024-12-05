`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 09:24:57 PM
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input clk,
    input [7:0] dataToSend,
    input enable,
    output reg sent,
    output reg data_out
    );
    reg [7:0] count;
    reg [7:0] temp;
    reg sending = 0;
     always@(posedge clk) begin
        if (~sending & enable) begin
            temp <= dataToSend;
            sending <= 1;
            sent <= 0;
            count <= 0;
        end
        
        if (sending)count <= count + 1;
        else
            begin 
                count <= 0; data_out <= 1; 
            end
        // sampling every 16 ticks
        case (count)
            8'd8: data_out <= 0;
            8'd24: data_out <= temp[0];  
            8'd40: data_out <= temp[1];
            8'd56: data_out <= temp[2];
            8'd72: data_out <= temp[3];
            8'd88: data_out <= temp[4];
            8'd104: data_out <= temp[5];
            8'd120: data_out <= temp[6];
            8'd136: data_out <= temp[7];
            8'd152: begin sent <= 1; sending <= 0; end
        endcase
    end
endmodule
