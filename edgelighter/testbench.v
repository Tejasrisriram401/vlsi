`timescale 1ns / 1ps

module EdgeHighlighter_tb;
    reg clk, rst, signal_in;
    wire rising_edge, falling_edge;

    EdgeHighlighter uut (
        .clk(clk),
        .rst(rst),
        .signal_in(signal_in),
        .rising_edge(rising_edge),
        .falling_edge(falling_edge)
    );

    initial begin
        $dumpfile("edge_highlighter.vcd");
        $dumpvars(0, EdgeHighlighter_tb);

        clk = 0; rst = 1; signal_in = 0;
        #10 rst = 0;

        #10 signal_in = 1; // rising
        #20 signal_in = 0; // falling
        #20 signal_in = 1; // rising
        #10 signal_in = 0; // falling

        #20 $finish;
    end

    always #5 clk = ~clk;
endmodule
