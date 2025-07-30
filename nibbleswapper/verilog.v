module NibbleSwapper (
    input  wire       clk,
    input  wire       rst,
    input  wire       swap,
    input  wire [7:0] data_in,
    output reg  [7:0] data_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            data_out <= 8'b0;
        else if (swap)
            data_out <= {data_in[3:0], data_in[7:4]};
        else
            data_out <= data_in;
    end
endmodule
