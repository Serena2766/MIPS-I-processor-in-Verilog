`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2019 03:28:13 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(clk, rst, address, write_data, read_data, MemWrite);

	input clk, rst;
	input [31:0] address;
	input [31:0] write_data;
	output [31:0] read_data;
	input MemWrite;
	
	reg [31:0] mem[1023:0];
    integer index;
	assign read_data = mem[address]; //Verilog might allow or not

	always@(posedge clk)
	begin
	    if(rst)begin
	       for (index=0; index<1024; index=index+1) begin
              mem[index] <= 32'h00000000;
            end
	    end
	    else begin
            if(MemWrite)
             begin
                mem[address] <= write_data;
            end
        end
    end


endmodule