`timescale 1ns / 1ps

module EvenOddFSM_tb;
    reg clk, rst, valid;
    reg [3:0] num_in;
    wire is_even;

    EvenOddFSM uut (
        .clk(clk),
        .rst(rst),
        .num_in(num_in),
        .valid(valid),
        .is_even(is_even)
    );

    initial begin
        $dumpfile("even_odd_fsm.vcd");
        $dumpvars(0, EvenOddFSM_tb);

        clk = 0; rst = 1; valid = 0; num_in = 0;
        #10 rst = 0;

        #10 num_in = 4'd2; valid = 1;
        #10 valid = 0;

        #10 num_in = 4'd7; valid = 1;
        #10 valid = 0;

        #10 num_in = 4'd6; valid = 1;
        #10 valid = 0;

        #20 $finish;
    end

    always #5 clk = ~clk;
endmodule
