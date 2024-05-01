
 module adding_block(
    output reg [31:0] r,
    input [31:0] y,
    input [31:0] x
    );
always @(x,y)
begin
 r <= x+y;
end
endmodule
