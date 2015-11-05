//Subject:     CO project 2 - Instruction Memory
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Instr_Memory(
    pc_addr_i,
	instr_o
	);
     
//I/O ports
input  [32-1:0]  pc_addr_i;
output [32-1:0]	 instr_o;

//Internal Signals
integer          i;


//32 words Memory
reg		[31:0]		instruction_file	[0:31];
//Parameter
    
//Main function




//Initial Memory Contents
initial begin	
/*
//test1
instruction_file[0] =32'b00100000000000010000000000010000;	//addi r1,r0,16
instruction_file[1] =32'b00000000001000010001000000011000;	//nop
instruction_file[2] =32'b00100000000000110000000000001000;	//nop
instruction_file[3] =32'b10101100000000010000000000000100;	//addi r2,r1,4

instruction_file[4] =32'b10001100000001000000000000000100;	//addi r3,r0,8
instruction_file[5] =32'b00000000100000110010100000100010;	//sw r0,r1,4

instruction_file[6] =32'b00000000011000010011000000100000;	//nop

instruction_file[7] =32'b00100000001001110000000000001010;	//lw r0,r4,4
instruction_file[8] =32'b00000000111000110100000000100100;	//nop
instruction_file[9] =32'b00000001000001110100100000101010;	//nop
/*
instruction_file[10]=32'b00100000000111100011001101000101;	//sub r5,r4,r3
*/
//test2

instruction_file[0] =32'b00000000000000000100000000100000;
instruction_file[1] =32'b00100000000010010000000000001010;
instruction_file[2] =32'b00100000000010100000000000001101;
instruction_file[3] =32'b00000001001010010101100000011000;
instruction_file[4] =32'b00100000000010000000000000001010;
instruction_file[5] =32'b00100000000010010000000000000100;
instruction_file[6] =32'b00000001000010010110000000011000;
instruction_file[7] =32'b00100000000011100000000000001000;
instruction_file[8] =32'b00000001100011100100000000100010;
instruction_file[9] =32'b00100000000010010000000000000000;
instruction_file[10]=32'b10001101000010110000000000000000;
instruction_file[11]=32'b10001101000010100000000000000100;
instruction_file[12]=32'b00011101010010110000000000000011;
instruction_file[13]=32'b10101101000010100000000000000000;
instruction_file[14]=32'b10101101000010110000000000000100;
instruction_file[15]=32'b00100000000010010000000000000001;
instruction_file[16]=32'b00100000000011010000000000000100;
instruction_file[17]=32'b00000001000011010100000000100010;
instruction_file[18]=32'b00000101000000011111111111110111;
instruction_file[19]=32'b00010101001000001111111111110011;
instruction_file[20]=32'b00100000000111100011001101000101;
instruction_file[21]=32'b00000000000000000000000000000000;










end

assign	instr_o = instruction_file[pc_addr_i/4];  

endmodule
