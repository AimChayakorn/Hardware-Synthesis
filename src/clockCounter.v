`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 09:53:09 PM
// Design Name: 
// Module Name: clockCounter
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


module clockCounter(
    input clk,
    output reg tclk
    );
    integer counter;
    initial counter =0;
    always @(posedge clk) begin
        counter = counter + 1;
        if (counter >= 325) begin 
            counter = 0; tclk = ~tclk; 
        end 
    end
endmodule
