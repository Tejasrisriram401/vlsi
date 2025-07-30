module EvenOddFSM (
    input  wire       clk,
    input  wire       rst,
    input  wire [3:0] num_in,
    input  wire       valid,
    output reg        is_even
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            is_even <= 1;
        else if (valid)
            is_even <= ~num_in[0];  // LSB = 0 for even, 1 for odd
    end
endmodule
