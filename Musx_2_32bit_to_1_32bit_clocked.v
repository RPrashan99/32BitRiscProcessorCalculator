

module mux_2_to_1_32_bit_clocked(
    output reg [31:0] z,
    input [31:0] x,
    input [31:0] y,
    input s
    );

always @(s)
 begin
  if(s==1'b1)
   z<=x;
  else if(s==1'b0)
   z<=y;
  else
   z<=32'hxxxxxxxx;
 end
endmodule
