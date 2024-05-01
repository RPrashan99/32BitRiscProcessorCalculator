

module anding_logic(
	output reg a,
	input branch,
	input zero
    );
	always @(branch,zero)
	begin
		a <= branch & zero;
	end
endmodule
