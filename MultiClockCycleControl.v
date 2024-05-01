
module Single_cycle_Control_unit_FSM(
    output reg ALUSrc,
    output reg RegDst,
    output reg RegWrite,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg MemRead,
  output reg branch,
  output reg jump,
    input [5:0] Opcode,
    input zero,
    input Overflow,
    input Reset,
    input clock
    );


reg [3:0] NS;
reg [3:0] PS;


parameter s0 = 4'd0;
parameter s1 = 4'd1;
parameter s2 = 4'd2;
parameter s3 = 4'd3;
parameter s4 = 4'd4;
parameter s5 = 4'd5;
parameter s6 = 4'd6;
parameter s7 = 4'd7;
parameter s8 = 4'd8;
parameter s9 = 4'd9;

parameter lw = 6'b100011;
parameter sw = 6'b101011;
parameter R_type = 6'b000000;
parameter B_type = 6'b000100;
parameter J_type = 6'b000010;

/*initial 
begin
NS <= 4'b0000;
end*/

always @(posedge clock)
begin
 case(PS)
  //s0: NS <= s1;
  s0: begin
     if(Opcode == lw || Opcode == sw)
      begin
      NS <= s2;
      end
     else if(Opcode == R_type)
      begin
      NS <= s5;
      end
     else if(Opcode == B_type)
      begin
      NS <= s7;
      end
     else if(Opcode == J_type)
      begin
      NS <= s8;
      end
     else
      NS <= s0;
    end
  s2: begin
     if(Opcode == lw)
      NS <= s3;
     else if(Opcode == sw)
      NS <= s4;
     else 
      NS <= s0;
    end
  s3:  NS <= s9;
  s4:  NS <= s0;
  s5:  NS <= s6;
  s6:  NS <= s0;
  s7: NS <= s0;
  s8:   NS <= s0;
  s9:   NS <= s0;
 default: NS <= s0;
 endcase
end

always @(NS)
begin
 if(Reset == 1'b1)
  PS <= s0;
 else
  PS <= NS;
end

always @(NS)
begin
 case(NS)
  s0: begin
    RegDst <= 1'bx;
    jump <= 1'bx;
    ALUSrc <= 1'bx;
    MemtoReg <= 1'bx;
    RegWrite <= 1'bx;
    MemRead <= 1'bx;
    MemWrite <= 1'bx;
    branch <= 1'bx;
    ALUOp <= 2'bxx;
   end
  /*s1: begin
    RegDst <= 1'bx;
    jump <= 1'bx;
    ALUSrc <= 1'bx;
    MemtoReg <= 1'bx;
    RegWrite <= 1'bx;
    MemRead <= 1'bx;
    MemWrite <= 1'bx;
    branch <= 1'bx;
    ALUOp <= 2'bxx;
   end*/
  s2: begin
    RegDst <= 1'bx;
    jump <= 1'bx;
    ALUSrc <= 1'b1;
    MemtoReg <= 1'bx;
    RegWrite <= 1'bx;
    MemRead <= 1'bx;
    MemWrite <= 1'bx;
    branch <= 1'bx;
    ALUOp <= 2'b00;
   end
  s3: begin
    RegDst <= 1'bx;
    jump <= 1'bx;
    ALUSrc <= 1'b1;
    MemtoReg <= 1'bx;
    RegWrite <= 1'bx;
    MemRead <= 1'b1;
    MemWrite <= 1'b0;
    branch <= 1'bx;
    ALUOp <= 2'b00;
   end
  s4: begin
    RegDst <= 1'bx;
    jump <= 1'b0;
    ALUSrc <= 1'b1;
    MemtoReg <= 1'bx;
    RegWrite <= 1'b0;
    MemRead <= 1'b0;
    MemWrite <= 1'b1;
    branch <= 1'b0;
    ALUOp <= 2'b00;
   end
  s5: begin
    RegDst <= 1'bx;
    jump <= 1'bx;
    ALUSrc <= 1'b0;
    MemtoReg <= 1'bx;
    RegWrite <= 1'bx;
    MemRead <= 1'bx;
    MemWrite <= 1'bx;
    branch <= 1'bx;
    ALUOp <= 2'b10;
   end
  s6: begin
    RegDst <= 1'b1;
    jump <= 1'b0;
    ALUSrc <= 1'b0;
    MemtoReg <= 1'b0;
    RegWrite <= 1'b1;
    MemRead <= 1'b0;
    MemWrite <= 1'b0;
    branch <= 1'b0;
    ALUOp <= 2'b10;
   end
  s7: begin
    RegDst <= 1'bx;
    jump <= 1'b0;
    ALUSrc <= 1'b0;
    MemtoReg <= 1'bx;
    RegWrite <= 1'b0;
    MemRead <= 1'b0;
    MemWrite <= 1'b0;
    branch <= 1'b1;
    ALUOp <= 2'b01;
   end
  s8: begin
      RegDst <= 1'bx;
    jump <= 1'b1;
    ALUSrc <= 1'bx;
    MemtoReg <= 1'bx;
    RegWrite <= 1'bx;
    MemRead <= 1'bx;
    MemWrite <= 1'bx;
    branch <= 1'bx;
    ALUOp <= 2'bxx;
   end
  s9: begin
    RegDst <= 1'b0;
    jump <= 1'b0;
    ALUSrc <= 1'b1;
    MemtoReg <= 1'b1;
    RegWrite <= 1'b1;
    MemRead <= 1'b1;
    MemWrite <= 1'b0;
    branch <= 1'b0;
    ALUOp <= 2'b00;
   end
 endcase
end

endmodule
