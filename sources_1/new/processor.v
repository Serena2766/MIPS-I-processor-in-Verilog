`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2019 03:19:20 PM
// Design Name: 
// Module Name: processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module processor(clk, rst);
	input clk;
	input rst;

	reg [31:0] pc;
	wire [31:0] new_pc;

	always@(posedge clk)
	begin
		if(rst)
			pc <= 32'd0;
		else
		begin
			pc <= new_pc;
		end
	end

	wire [31:0] pcplus4 = pc + 4;

	wire [31:0] instruction;
 
	wire [31:0] extented_inst = {{16{instruction[15]}},instruction[15:0]};

	wire [31:0] jump_address = {pcplus4[31:28],instruction[25:0],2'b0};
    
    wire reg_dst, jump, branch, zero, MemtoReg, ALUSrc, RegWrite, MemWrite, MemRead;
    wire [2:0] ALUOp;
    
	assign new_pc = (jump)? jump_address:
			(branch & zero) ? pcplus4  + {extented_inst[29:0],2'b00}:
						pcplus4 ;

	wire [4:0] reg_file_write_address;
	assign reg_file_write_address = (reg_dst) ? instruction[15:11] :instruction[20:16] ;
	
	wire [31:0] alu_result;

	// REGISTER WIRES
	wire mem_read_data;
	wire [31:0] reg_file_write_data = (MemtoReg) ? mem_read_data : alu_result;
	wire [31:0] reg_file_out1 ;
	wire [31:0] reg_file_out2;
    
	// ALU WIRES
	wire [31:0] operand2 = (ALUSrc) ? extented_inst: reg_file_out2;
    wire [5:0] operation;
    
	// INstantiation
	reg_file my_reg_file(.clk, .rst, .reg1_address(instruction[25:21]), .reg2_address(instruction[20:16]), .regw_address(reg_file_write_address), .write_data(reg_file_write_data), .read_data1(reg_file_out1), .read_data2(reg_file_out2), .RegWrite);
	ALU_ctl my_ALU_ctl(.instruction(instruction[5:0]), .ALUOp, .ctl(operation));
	ALU my_ALU(.op1(reg_file_out1), .op2(operand2), .result(alu_result), .zero(zero), .control(operation));
	data_mem my_data_mem(.clk, .rst, .address(alu_result), .write_data(reg_file_out2), .read_data(mem_read_data), .MemWrite(MemWrite));
	ins_mem my_ins_mem(.address(pc), .instruction(instruction));
    control my_control(.instruction(instruction[31:26]), .reg_dst, .jump, .branch, .MemRead, .MemtoReg, .ALUOp, .MemWrite, .ALUSrc, .RegWrite(RegWrite));
endmodule



