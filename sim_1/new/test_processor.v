`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2019 08:10:13 PM
// Design Name: 
// Module Name: test_processor
// Project Name: test_processor_behav.wcfg
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


module test_processor;
    reg clk, rst;
    processor uut(.clk,.rst);
  
    initial
    begin
        clk = 0;
        rst = 1;
        #10;
        @(posedge clk);
        rst = 0;

    end
    always clk = #5 ~clk;  
endmodule
