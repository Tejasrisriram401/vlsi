`timescale 1ns / 1ps

module DebouncerLite_tb;
    reg clk, rst, noisy_in;
    wire clean_out;

    DebouncerLite uut (
        .clk(clk),
        .rst(rst),
        .noisy_in(noisy_in),
        .clean_out(clean_out)
    );

    initial begin
        $dumpfile("debouncer_lite.vcd");
        $dumpvars(0, DebouncerLite_tb);

        clk = 0; rst = 1; noisy_in = 0;
        #10 rst = 0;

        // Noisy toggle
        #10 noisy_in = 1;
        #5  noisy_in = 0;
        #5  noisy_in = 1;
        #10 noisy_in = 1;
        #10 noisy_in = 1;

        // Now stable low
        #10 noisy_in = 0;
        #10 noisy_in = 0;
        #10 noisy_in = 0;

        #20 $finish;
    end

    always #5 clk = ~clk;
endmodule
