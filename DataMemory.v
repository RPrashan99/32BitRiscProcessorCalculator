//Module: Data Memory

module memory_block(
    output reg [31:0] Read_data,
    input MemWrite,
    input MemRead,
    input [31:0] Address,
    input [31:0] Write_data
    );
reg [7:0] mem_addr;//_read;
//reg [7:0] mem_addr_write;
reg [31:0] block[0:255];

initial
begin
block[19] <= 32'h55555555;
block[200] <= 32'hfedcba98;
end

always @(Address)
begin
mem_addr <= Address[7:0];
end

always @(mem_addr,MemWrite,MemRead)
begin
 if(MemWrite == 1'b1 && MemRead == 1'b0)
 begin 
  block[mem_addr] <= Write_data;
 end

 if(MemRead == 1'b1 && MemWrite == 1'b0)
 begin
  Read_data <= block[mem_addr];
 end

end

endmodule
