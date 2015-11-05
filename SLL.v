`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:28 10/30/2011 
// Design Name: 
// Module Name:    SLL 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SLL(
     data_in,
     sll_mux,
     sll_num,
	  final_result

    );

input [32-1:0] data_in;
input sll_mux;
input [6-1:0]sll_num;
output [32-1:0] final_result;

reg [32-1:0] final_result;

always@(data_in or sll_mux or sll_num)
begin
 if(sll_mux==1)
   begin
	  final_result<=(data_in<<sll_num);
   end
	else
	  final_result<=data_in; 

end
endmodule



