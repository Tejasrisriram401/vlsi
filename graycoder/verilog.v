module GrayCoder (
    input  wire       clk,
    input  wire       rst,
    input  wire [3:0] bin_in,
    input  wire       valid,
    output reg  [3:0] gray_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            gray_out <= 0;
        else if (valid)
            gray_out <= bin_in ^ (bin_in >> 1);
    end
endmodule
