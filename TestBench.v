//Subject:     CO project 4 - Test Bench
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

`define CYCLE_TIME 2		

module TestBench;

//Internal Signals
reg         CLK;
reg         RST;
integer     i;
integer     handle;
integer     count;
//Greate tested modle  
Pipe_CPU_1 CPU(
        .clk_i(CLK),
	.rst_i(RST)
		);
 
//Main function

always #(`CYCLE_TIME/2) CLK = ~CLK;	

initial  begin
    //handle = $fopen("P4_Result.dat");
	CLK = 0;
   RST = 0;
   i = 0;
   count = 0; 
    #(`CYCLE_TIME)      RST = 1;

end


always@(posedge CLK) begin
  count = count + 1;
    	$display("\nMemory===========================================================\n");

	 
	
	$display("count=%d pc=%d ~DATAHAZARD=%d MREAD=%d EX_RT=%d     ID_RS=%d ID_RT=%d~ ~FA=%d FB=%d%~ [zero=%d branch=%d baddr=%d]\n" , count , CPU.PC.pc_in_i , CPU.IF_flush , CPU.MemRead_reg , CPU.RT_reg,CPU.instruction_reg[25:21],CPU.instruction_reg[20:16] , CPU.MUX_A , CPU.MUX_B , CPU.Zero_reg , CPU.Branch_reg_reg , CPU.SUM_1_reg);
	$display("IFID=%x \n",CPU.instruction_reg);
	
    $display("PC = %d", CPU.PC.pc_out_o);
    $display("Data Memory = %d, %d, %d, %d, %d, %d, %d, %d",CPU.Data_Memory.memory[0], CPU.Data_Memory.memory[1], CPU.Data_Memory.memory[2], CPU.Data_Memory.memory[3], CPU.Data_Memory.memory[4], CPU.Data_Memory.memory[5], CPU.Data_Memory.memory[6], CPU.Data_Memory.memory[7]);
    $display("Data Memory = %d, %d, %d, %d, %d, %d, %d, %d",CPU.Data_Memory.memory[8], CPU.Data_Memory.memory[9], CPU.Data_Memory.memory[10], CPU.Data_Memory.memory[11], CPU.Data_Memory.memory[12], CPU.Data_Memory.memory[13], CPU.Data_Memory.memory[14], CPU.Data_Memory.memory[15]);
    $display("Data Memory = %d, %d, %d, %d, %d, %d, %d, %d",CPU.Data_Memory.memory[16], CPU.Data_Memory.memory[17], CPU.Data_Memory.memory[18], CPU.Data_Memory.memory[19], CPU.Data_Memory.memory[20], CPU.Data_Memory.memory[21], CPU.Data_Memory.memory[22], CPU.Data_Memory.memory[23]);
    $display("Data Memory = %d, %d, %d, %d, %d, %d, %d, %d",CPU.Data_Memory.memory[24], CPU.Data_Memory.memory[25], CPU.Data_Memory.memory[26], CPU.Data_Memory.memory[27], CPU.Data_Memory.memory[28], CPU.Data_Memory.memory[29], CPU.Data_Memory.memory[30], CPU.Data_Memory.memory[31]);
    
	 $display("\nRegisters");
    $display("R0 = %d, R1 = %d, R2 = %d, R3 = %d, R4 = %d, R5 = %d, R6 = %d, R7 = %d", CPU.Registers.Reg_File[ 0], CPU.Registers.Reg_File[ 1], CPU.Registers.Reg_File[ 2], CPU.Registers.Reg_File[ 3], CPU.Registers.Reg_File[ 4], CPU.Registers.Reg_File[ 5], CPU.Registers.Reg_File[ 6], CPU.Registers.Reg_File[ 7]);
    $display("R8 = %d, R9 = %d, R10 =%d, R11 =%d, R12 =%d, R13 =%d, R14 =%d, R15 =%d", CPU.Registers.Reg_File[ 8], CPU.Registers.Reg_File[ 9], CPU.Registers.Reg_File[10], CPU.Registers.Reg_File[11], CPU.Registers.Reg_File[12], CPU.Registers.Reg_File[13], CPU.Registers.Reg_File[14], CPU.Registers.Reg_File[15]);
    $display("R16 =%d, R17 =%d, R18 =%d, R19 =%d, R20 =%d, R21 =%d, R22 =%d, R23 =%d", CPU.Registers.Reg_File[16], CPU.Registers.Reg_File[17], CPU.Registers.Reg_File[18], CPU.Registers.Reg_File[19], CPU.Registers.Reg_File[20], CPU.Registers.Reg_File[21], CPU.Registers.Reg_File[22], CPU.Registers.Reg_File[23]);
    $display("R24 =%d, R25 =%d, R26 =%d, R27 =%d, R28 =%d, R29 =%d, R30 =%d, R31 =%d", CPU.Registers.Reg_File[24], CPU.Registers.Reg_File[25], CPU.Registers.Reg_File[26], CPU.Registers.Reg_File[27], CPU.Registers.Reg_File[28], CPU.Registers.Reg_File[29], CPU.Registers.Reg_File[30], CPU.Registers.Reg_File[31]);
    
    if(CPU.Registers.Reg_File[30]===32'h3345)begin//若想自行測試請加入addi r30,r0,0x3345 00100000000111100011001101000101  才會結束
        $display("Elapsed cycles: %d ",i);
        $stop;
      end
    if(RST)i=i+1;

end
  
endmodule

