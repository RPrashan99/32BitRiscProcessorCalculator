
module sign_extend(
    output reg [31:0] y,
    input [15:0] x/*,
  input clock*/
    );
always @(/*posedge clock*/ x)
begin
 if(x[15] == 1'b1)
  begin
   y[31:16] <= 16'b1111111111111111;
   y[15:0] <= x[15:0];
  end
 else if(x[15] == 1'b0)
  begin
   y[31:16] <= 16'b0000000000000000;
   y[15:0] <= x[15:0];
  end
 else
  begin
   y[31:16] <= 16'bxxxxxxxxxxxxxxxx;
   y[15:0] <= x[15:0];
  end
end
endmodule
