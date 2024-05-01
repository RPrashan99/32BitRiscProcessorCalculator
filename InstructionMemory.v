
module instr_memory_unit(
    output reg [31:0] Instruction,
    input [31:0] Address
    );

reg [31:0] instr_memory[0:255];
reg [7:0] addr;

initial
begin
 instr_memory[0] <= 32'b00000000000000000000100000100000;
 instr_memory[1] <= 32'b10101100011010000000000000000111;
 instr_memory[2] <= 32'b10001100011001000000000000000111;
 instr_memory[3] <= 32'b00000000100001000001100000100000;
 instr_memory[4] <= 32'b00010000001000010000000000001001;
 instr_memory[5] <= 32'h00000000;
 instr_memory[9] <= 32'hfedcba98;
 instr_memory[10] <= 32'b00001000000000000000000000000100;
 instr_memory[16] <= 32'h45671234;
 instr_memory[41] <= 32'b00001000000000000000000000000001;
end

always @(Address)
begin 
 addr <= Address[7:0];
end
always @(addr)
begin
 Instruction <= instr_memory[addr];
end
endmodule
