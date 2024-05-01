module alu01(
    output reg [31:0] r,
    input [31:0] x,
    input [31:0] y,
    input [2:0] op,
    output reg zero
);

always @(op or x or y)
begin
    case(op)
        3'b000: r <= x & y;
        3'b001: r <= x | y;
        3'b010: r <= x + y;
        3'b011: r <= 32'h0; 
        3'b100: r <= 32'h0;
        3'b101: r <= 32'h0;
        3'b110: r <= x - y;
        3'b111: r <= x - y;
        default: r <= 32'hxxxxxxxx;
    endcase
end

always @(r)
begin
    if (r == 32'h00000000)
        zero <= 1'b1;
    else if (r == 32'hxxxxxxxx)
        zero <= 1'bx;
    else
        zero <= 1'b0;
end

endmodule

