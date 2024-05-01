//Module: ALU control unit

module ALU_control_signals(
    output reg [2:0] Op_select,
    input [5:0] Instruction,
    input [1:0] ALUOp
    );
always @(ALUOp)
begin
Op_select[0] <= (ALUOp[1] & (Instruction[3] | Instruction[0]));
Op_select[1] <= (~ALUOp[1])|(~Instruction[2]);
Op_select[2] <= ALUOp[0] | (ALUOp[1] & Instruction[1]);
end
endmodule
