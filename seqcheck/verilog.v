module SeqCheck (
    input  wire clk,
    input  wire rst,
    input  wire in_sig,
    output reg  pattern_found
);
    reg [2:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 3'b000;
            pattern_found <= 0;
        end else begin
            shift_reg <= {shift_reg[1:0], in_sig};
            pattern_found <= (shift_reg == 3'b110) && in_sig;
        end
    end
endmodule
