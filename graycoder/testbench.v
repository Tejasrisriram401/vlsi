`timescale 1ns / 1ps

module GrayCoder_tb;
    reg clk, rst, valid;
    reg [3:0] bin_in;
    wire [3:0] gray_out;

    GrayCoder uut (
        .clk(clk),
        .rst(rst),
        .bin_in(bin_in),
        .valid(valid),
        .gray_out(gray_out)
    );

    initial begin
        $dumpfile("gray_coder.vcd");
        $dumpvars(0, GrayCoder_tb);

        clk = 0; rst = 1; valid = 0; bin_in = 0;
        #10 rst = 0;

        #10 bin_in = 4'd3; valid = 1;
        #10 valid = 0;

        #10 bin_in = 4'd7; valid = 1;
        #10 valid = 0;

        #10 bin_in = 4'd15; valid = 1;
        #10 valid = 0;

        #20 $finish;
    end

    always #5 clk = ~clk;
endmodule
