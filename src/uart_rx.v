`timescale 1ns / 1ps


module uart_rx(
    input clk,
    input data_in,
    output reg received,
    output reg [7:0] data_out
    );

    reg previous_bit;
    reg receiving = 0;
    reg [7:0] count;

    always@(posedge clk) begin
        if (~receiving & previous_bit & ~data_in) begin 
            receiving <= 1;
            received <= 0;
            count <= 0;
        end

        previous_bit <= data_in;
        count <= (receiving)? count+1 : 0;

        case (count)
            8'd24:  data_out[0] <= data_in;
            8'd40:  data_out[1] <= data_in;
            8'd56:  data_out[2] <= data_in;
            8'd72:  data_out[3] <= data_in;
            8'd88:  data_out[4] <= data_in;
            8'd104: data_out[5] <= data_in;
            8'd120: data_out[6] <= data_in;
            8'd136: data_out[7] <= data_in;
            8'd152: begin received <= 1; receiving <= 0; end
            8'd184: received <= 0;
        endcase
    end
endmodule