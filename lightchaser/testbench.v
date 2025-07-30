`timescale 1ns / 1ps

module LightChaser_tb;
    reg clk, rst, enable;
    wire [7:0] leds;

    LightChaser uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .leds(leds)
    );

    initial begin
        $dumpfile("light_chaser.vcd");
        $dumpvars(0, LightChaser_tb);

        clk = 0; rst = 1; enable = 0;
        #10 rst = 0;

        enable = 1;
        #100;

        enable = 0;
        #20;

        enable = 1;
        #100;

        $finish;
    end

    always #5 clk = ~clk;
endmodule
