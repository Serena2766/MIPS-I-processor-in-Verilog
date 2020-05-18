`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2019 03:29:23 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(clk, rst, reg1_address, reg2_address, regw_address, write_data, read_data1, read_data2, RegWrite);

	input clk,rst;
	input [4:0] reg1_address;
	input [4:0] reg2_address;
	input [4:0] regw_address; 
	input [31:0] write_data;
	output [31:0] read_data1;
	output [31:0] read_data2;
	input RegWrite;
	
	reg [31:0] registers[31:0];
    integer index;
	assign read_data1 = registers[reg1_address]; //Verilog might allow or not
	assign read_data2 = registers[reg2_address]; //Verilog might allow or not


	always@(posedge clk)
	begin
	    if(rst)begin
               for (index=0; index<32; index=index+1) begin
                  registers[index] <= 32'h00000000;
                end
        end
        else begin
            if(RegWrite)
            begin
                registers[regw_address] <= write_data;
            end
        end
	end	

endmodule
