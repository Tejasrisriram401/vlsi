module RotatorUnit (
    input  wire       clk,
    input  wire       rst,
    input  wire       dir,       // 0 = left, 1 = right
    input  wire [7:0] data_in,
    input  wire       load,
    output reg  [7:0] data_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            data_out <= 0;
        else if (load)
            data_out <= data_in;
        else if (dir)
            data_out <= {data_out[0], data_out[7:1]};  // right
        else
            data_out <= {data_out[6:0], data_out[7]};  // left
    end
endmodule
