`timescale 1ns / 1ps

module NibbleSwapper_tb;
    reg clk, rst, swap;
    reg [7:0] data_in;
    wire [7:0] data_out;

    NibbleSwapper uut (
        .clk(clk),
        .rst(rst),
        .swap(swap),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        $dumpfile("nibble_swapper.vcd");
        $dumpvars(0, NibbleSwapper_tb);

        clk = 0; rst = 1; swap = 0; data_in = 0;
        #10 rst = 0;

        #10 data_in = 8'hAB; swap = 1;
        #10 swap = 0;

        #10 data_in = 8'hF0; swap = 1;
        #10 swap = 0;

        #20 $finish;
    end

    always #5 clk = ~clk;
endmodule
