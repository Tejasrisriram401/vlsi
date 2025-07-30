`timescale 1ns / 1ps

module SeqCheck_tb;
    reg clk, rst, in_sig;
    wire pattern_found;

    SeqCheck uut (
        .clk(clk),
        .rst(rst),
        .in_sig(in_sig),
        .pattern_found(pattern_found)
    );

    initial begin
        $dumpfile("seq_check.vcd");
        $dumpvars(0, SeqCheck_tb);

        clk = 0; rst = 1; in_sig = 0;
        #10 rst = 0;

        // Create pattern: 1, 1, 0
        #10 in_sig = 1;
        #10 in_sig = 1;
        #10 in_sig = 0; // should detect pattern
        #10 in_sig = 1;
        #10 in_sig = 1;
        #10 in_sig = 1;

        #20 $finish;
    end

    always #5 clk = ~clk;
endmodule
