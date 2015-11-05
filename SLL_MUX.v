`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:32 10/30/2011 
// Design Name: 
// Module Name:    SLL_MUX 
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
module SLL_MUX(
    data_i_1,
	 data_i_2,
    
	 select,
    data_o
    );

input [6-1:0] data_i_1;
input [15-1:0] data_i_2;
output select;
output [6-1:0] data_o;

reg select;
assign data_o=data_i_2[10:6];
assign fun=data_i_2[5:0];

always@( data_i_1 or  data_i_2)
begin

if(data_i_1==0&&fun==0)
   select<=1;

else 
   select<=0;
end


 
	
endmodule
