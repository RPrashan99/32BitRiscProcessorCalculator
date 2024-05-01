
module pc_register(
    output reg [31:0] y,
    input [31:0] x,
    input clock
    );
reg [31:0] s;

initial 
begin
s <= 32'h00000000;
end

always @(posedge clock)
begin
  y <= s;
end 

always @(x)
begin
  
  s <= x;
   
end
endmodule
