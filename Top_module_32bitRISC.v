

module Top_module_for_RISC_single_cycle_32_bit(
input clock,
input Reset
    );

wire ALUSrc,RegDst,RegWrite,MemtoReg,MemWrite,MemRead,branch,jump,zero;
wire [1:0] ALUOp;
wire [31:0] Instruction,Address;
wire [2:0] op;
wire [31:0] PC_4,ALUSrc_1,r,Read_data,adding_1,jump_input_0;
wire [31:0] read_reg_1,read_reg_2,write_data,adding_r,jump_address;
wire [31:0] ALU_input_2;
wire [4:0] write_reg;
wire a5;
wire [27:0] x;

adder_04 a4(
     .Y(PC_4),
     .X(Address)
    );
  
pc_register p1(
    .y(Address),
    .x(jump_address),
    .clock(clock)
    );
  
instr_memory_unit i0(
    .Instruction(Instruction),
    .Address(Address)
    );

Single_cycle_Control_unit_FSM s0(
    .ALUSrc(ALUSrc),
    .RegDst(RegDst),
    .RegWrite(RegWrite),
    .MemtoReg(MemtoReg),
    .ALUOp(ALUOp),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .branch(branch),
    .jump(jump),
    .Opcode(Instruction[31:26]),
    .zero(),
    .Overflow(),
    .Reset(Reset),
    .clock(clock)
    );
  
ALU_control_signals a0(
  .Op_select(op),
    .Instruction(Instruction[5:0]),
    .ALUOp(ALUOp)
    );
  
alu a1(
     .r(r),
     .clock(clock),
     .x(read_reg_1),
     .y(ALU_input_2),
     .op(op),
   .zero(zero)
  //output reg Overflow
    );
  
  
Register_file r1(
     .reg_1_data(read_reg_1),
     .reg_2_data(read_reg_2),
     .read_reg_1(Instruction[25:21]),
     .read_reg_2(Instruction[20:16]),
   .write_reg(write_reg),
     .write_data(write_data),
     .RegWrite(RegWrite),
   .clock(clock)
    );


memory_block m1(
     .Read_data(Read_data),
     .MemWrite(MemWrite),
     .MemRead(MemRead),
     .Address(r),
     .Write_data(read_reg_2)
    );
  
shifting_left s1(
     .Y(adding_1),
     .X(ALUSrc_1)/*,
   .clock(clock)*/
    );
  
shit_left_2_in_J_type s2(
     .Y(x),
     .X(Instruction[25:0])/*,
     .clock(clock)*/
    );
  
sign_extend s3(
     .y(ALUSrc_1),
     .x(Instruction[15:0])/*,
   .clock(clock)*/
    );
  
mux_2_to_1_5_bit m2(
     .z(write_reg),
     .x(Instruction[15:11]),
     .y(Instruction[20:16]),
     .RegDst(RegDst)
    );
  
adding_block a3(
     .r(adding_r),
     .y(PC_4),
     .x(adding_1)
    );
  
mux_2_to_1_32_bit m3(
     .z(ALU_input_2),
     .x(ALUSrc_1),
     .y(read_reg_2),
     .s(ALUSrc),
   .clock(clock)
    );
  
mux_2_to_1_32_bit m4(
     .z(write_data),
     .x(Read_data),
     .y(r),
     .s(MemtoReg),
   .clock(clock)
    );
  
anding_logic a6(.a(a5),.branch(branch),.zero(zero));
  
//assign a5 = branch & zero;

mux_2_to_1_32_bit_clocked m5(
     .z(jump_input_0),
     .x(adding_r),
     .y(PC_4),
     .s(a5)
    );
  
mux_2_to_1_32_bit_clocked m6(
     .z(jump_address),
     .x({PC_4[31:28],x[27:0]}),
     .y(jump_input_0),
     .s(jump)
    );
endmodule

