
 module adder_04(
                   output reg [31:0] Y,
                   input [31:0] X
                    );
       always @(X)
                   begin
                   Y <= X+32'h00000001;
                   end
       endmodule
