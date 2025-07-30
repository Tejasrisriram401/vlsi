`timescale 1ns / 1ps

module RotatorUnit_tb;
    reg clk, rst, dir, load;
    reg [7:0] data_in;
    wire [7:0] data_out;

    RotatorUnit uut (
        .clk(clk),
        .rst(rst),
        .dir(dir),
        .data_in(data_in),
        .load(load),
        .data_out(data_out)
    );

    initial begin
        $dumpfile("rotator_unit.vcd");
        $dumpvars(0, RotatorUnit_tb);

        clk = 0; rst = 1; dir = 0; load = 0; data_in = 0;
        #10 rst = 0;

        data_in = 8'b10000001; load = 1;
        #10 load = 0;

        // Rotate left
        dir = 0;
        #50;

        // Rotate right
        dir = 1;
        #50;

        $finish;
    end

    always #5 clk = ~clk;
endmodule
