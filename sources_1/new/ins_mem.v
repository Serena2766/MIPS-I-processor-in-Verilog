`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2019 03:27:04 PM
// Design Name: 
// Module Name: ins_mem
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


module ins_mem ( address, instruction);

	input [31:0] address;
	output [31:0] instruction;

	assign instruction =  (address == 32'd0) ? {6'b001000,5'd0,5'd0,16'd1}  ://ADDI R0, R0, 1
				(address == 32'd4) ? {6'b000010,26'b0}  : //J Reset
				(address == 32'd4) ? {6'b000000,5'd0,5'd2,5'd1,5'd0,6'b100000}:  //ADD r1, r0, r2
				32'd0;

endmodule