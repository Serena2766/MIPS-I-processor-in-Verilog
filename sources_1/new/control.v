`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2019 03:32:29 PM
// Design Name: 
// Module Name: control
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
`define LW  6'b100011
`define SW  6'b101011
`define BEQ 6'b000100
`define J   6'b000010
`define ADDI 6'b001000
`define ANDI 6'b001000
module control(instruction, reg_dst, jump, branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

	input [5:0] instruction;
	output reg_dst;
	output jump;
	output branch;
	output MemRead;
	output MemtoReg;
	output [2:0] ALUOp;
    output MemWrite;
    output ALUSrc;
    output RegWrite;

//set to 1 when using instruction[15:11] as the write reg
	assign reg_dst = 	(instruction == 5'b00000) ? 1'b1:
							1'b0;	
	
	assign jump = (instruction == `J) ? 1'b1:
					1'b0;

	assign branch = (instruction == `BEQ) ? 1'b1:
					1'b0;   

	assign MemRead = (instruction == `LW) ? 1'b1:
					1'b0;
					
	assign MemtoReg = (instruction == `LW) ? 1'b1:
                       1'b0;    
                       
    assign ALUOp = (instruction == 5'b00000)? 3'b000:     
                   (instruction == `ADDI)? 3'b001: 
                   (instruction == `ANDI)? 3'b010:           
                    3'b0;
                    
 	assign MemWrite = (instruction == `SW) ? 1'b1:
                    1'b0;      
        
	assign ALUSrc =  (instruction == `LW) ? 1'b1: 
			         (instruction == `SW) ? 1'b1:
                     (instruction == `ADDI) ? 1'b1:	
					 1'b0;

	assign RegWrite =  (instruction == 5'b00000) ? 1'b1:
	                   (instruction == `ADDI)? 1'b1:
	                   (instruction == `ANDI)? 1'b1:
	                   (instruction == `LW) ? 1'b1:
					   1'b0;	
endmodule
