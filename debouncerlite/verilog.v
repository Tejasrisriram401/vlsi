module DebouncerLite (
    input  wire clk,
    input  wire rst,
    input  wire noisy_in,
    output reg  clean_out
);
    reg [2:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 3'b000;
            clean_out <= 0;
        end else begin
            shift_reg <= {shift_reg[1:0], noisy_in};
            if (&shift_reg)
                clean_out <= 1;
            else if (~|shift_reg)
                clean_out <= 0;
        end
    end
endmodule
