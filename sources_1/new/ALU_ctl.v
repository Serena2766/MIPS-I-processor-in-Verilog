`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2019 06:21:33 PM
// Design Name: 
// Module Name: ALU_ctl
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

module ALU_ctl(instruction, ALUOp, ctl);
    input [5:0] instruction;
    input [2:0] ALUOp;
    output [5:0]ctl;
    
    assign ctl = (ALUOp== 3'b000) ? instruction: 
                 (ALUOp== 3'b001) ?        `ADD:
                 (ALUOp== 3'b010) ?        `AND:
                  5'b0;

endmodule
