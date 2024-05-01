module alu01_tb;
    reg [31:0] x;
    reg [31:0] y;
    reg [2:0] op;
    wire [31:0] r;
    wire zero;

    // Instantiate the Unit Under Test (UUT)
    alu01 uut (
        .r(r),
        .x(x),
        .y(y),
        .op(op),
        .zero(zero)
    );

    initial begin
        // Initialize inputs
        x = 32'h00000000;
        y = 32'h00000000;
        op = 3'b000;

        // Apply inputs
        #10 x = 32'h00000001; y = 32'h00000010; op = 3'b010;  // ADD
        #10 x = 32'h00000002; y = 32'h00000001; op = 3'b110;  // SUB
        #10 x = 32'h00000001; y = 32'h00000001; op = 3'b000;  // AND
        #10 x = 32'h00000001; y = 32'h00000010; op = 3'b001;  // OR
        #10;
    end

    initial begin
        $monitor("At time %d, r = %h, zero = %b", $time, r, zero);
    end
endmodule

