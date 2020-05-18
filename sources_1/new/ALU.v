`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2019 03:30:35 PM
// Design Name: 
// Module Name: ALU
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
`define ADD 6'b100000
`define SUB 6'b100010
`define AND 6'b100100
`define OR  6'b100101
`define XOR 6'b100110
`define NOR 6'b100111
`define SLT 6'b101010
`define JR  6'b001000
`define JALR 6'b001001

module ALU(op1, op2, result, zero, control);

	input [31:0] op1;	
	input [31:0] op2;
	input [5:0] control;
	output [31:0] result;
	output zero;

	assign zero = (result == 32'd0) ? 1'b1: 1'b0;

	assign result = (control == `ADD)  ?  op1 + op2 :
			        (control == `SUB)  ?  op1 - op2 :
			        (control == `AND)  ?  op1 & op2 :
			        (control == `OR)  ?  op1 | op2 :
			        (control == `XOR)  ?  op1 ^ op2 :
                    (control == `NOR)  ?  ~(op1 | op2) :
			        (control == `SLT)  ?  (op1 > op2? 1'b1:1'b0) :
						32'd0;
endmodule
