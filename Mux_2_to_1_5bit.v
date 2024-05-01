
module mux_2_to_1_5_bit(
    output reg [4:0] z,
    input [4:0] x,
    input [4:0] y,
    input RegDst
    );
always @(RegDst)
 begin
  if(RegDst == 1'b1)
   z <= x;
  else if(RegDst == 1'b0)
   z <= y;
  else
   z <= 5'bxxxxx;
 end
endmodule
