

module shifting_left(
    output reg [31:0] Y,
    input [31:0] X/*,
  input clock*/
    );
always @(/*posedge clock*/X)
begin
Y <= X<<2;
end

endmodule
