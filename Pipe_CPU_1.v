//Subject:     CO project 4 - Pipe CPU 1
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Pipe_CPU_1(
        clk_i,
		rst_i
		);
    
/****************************************
I/O ports
****************************************/
input clk_i;
input rst_i;

/****************************************
Internal signal
****************************************/
/**** IF stage ****/

wire clk_i1=clk_i;
wire rst_i1=rst_i;

//reg pc_mux_control1;
reg[16:0] counter;
always@(posedge clk_i1)
begin
  if(!rst_i1)
  begin
  counter<=0;
 // pc_mux_control1<=0;
  end
 // else if(counter<4)
 // counter<=counter+1;
  else 
  begin
  counter<=counter+1;
 // pc_mux_control1<=Branch_reg_reg&Zero_reg;
  end
  
end

wire pc_mux_control;
assign pc_mux_control=(counter<4)?0:Branch_reg_reg&Zero_reg;

wire[32-1:0] PC_out,MUX_PC_out1,instruction,SUM_0,instruction_reg,SUM_0_reg;
wire [32-1:0] MUX_PC_out;

/**** ID stage ****/
wire[5-1:0] Write_reg;
wire[32-1:0] final,RSdata,RSdata_temp,RTdata,RTdata_temp,SE_out;
wire[32-1:0] RSdata_reg,RTdata_reg,SE_out_reg,SUM_0_reg_reg;

//control signal

wire [3-1:0] ALUop;
wire RegWrite,ALUSrc,RegDst,Jump,MemWrite,MemRead,MemtoReg;
wire Branch;

wire [3-1:0] ALUop_reg;
wire RegWrite_reg,ALUSrc_reg,RegDst_reg,Branch_reg,Jump_reg,MemWrite_reg,MemRead_reg,MemtoReg_reg;

wire [5-1:0] RS_reg,RT_reg,RD_reg;

/**** EX stage ****/
wire [32-1:0] Mux_ALUSrc_out,ALU_out,Shifter_out,SUM_1,SUM_1_reg,ALU_out_reg;
wire [6-1:0] AC_out;
wire Zero;
wire Zero_reg;
wire [5-1:0]  Mux_RegDst_out, Mux_RegDst_out_reg;

//control signal
wire RegWrite_reg_reg,Jump_reg_reg,MemWrite_reg_reg,MemRead_reg_reg,MemtoReg_reg_reg;
wire [32-1:0]RTdata_reg_reg;
wire Branch_reg_reg;
/**** MEM stage ****/

//control signal
wire RegWrite_reg_reg_reg,MemtoReg_reg_reg_reg;
wire [32-1:0]ALU_out_reg_reg,final_reg;
wire [5-1:0] Mux_RegDst_out_reg_reg;


/**** WB stage ****/

wire [32-1:0] last_final;
//control signal

/**** Forwardin unit ****/

wire [2-1:0] MUX_A;
wire [2-1:0] MUX_B;

/**** hazard detction ****/

wire IF_flush,PC_Write,ID_flush,EX_flush,IF_Write;
wire [6-1:0] control_input;


/****************************************
Instnatiate modules
****************************************/
//Instantiate the components in IF stage

MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(SUM_0),
        .data1_i(SUM_1_reg),
        .select_i(pc_mux_control),
        .data_o(MUX_PC_out)
        );	


ProgramCounter PC(
       .clk_i(clk_i1),      
	    .rst_i (rst_i1),     
	    .pc_in_i(MUX_PC_out) ,   
	    .pc_out_o(PC_out),
		 .pc_Write(PC_Write)
		 
        );

Instr_Memory IM(
        .pc_addr_i(PC_out),  
	    .instr_o(instruction)    
	    );
			
Adder Add_pc(
       .src1_i(PC_out),    
	    .src2_i(32'd4),     
	    .sum_o(SUM_0)    
		);

		
Pipe_Reg  #(.size(32)) IF_ID(       //N is the total length of input/output
       .clk_i(clk_i1), 
		 .IF_flush(IF_flush),
		 .IF_Write(IF_Write),
		 .data_i_1(SUM_0),
		 .data_i_2(instruction),
	  	 .data_o_1(SUM_0_reg),
		 .data_o_2(instruction_reg)

		);
		
//Instantiate the components in ID stage
Reg_File_1 Registers(
        .clk_i(clk_i1),
        .rst_i(rst_i1),
        .RegWrite_i(RegWrite_reg_reg_reg),
        .RSaddr_i(instruction_reg[25:21]),
        .RTaddr_i(instruction_reg[20:16]),
        .RDaddr_i(Mux_RegDst_out_reg_reg),
        .RDdata_i(last_final),

        .RSdata_o(RSdata),
        .RTdata_o(RTdata)   


		);

Decoder Control(
       .instr_op_i(control_input), 
	    .RegWrite_o(RegWrite), 
	    .ALU_op_o(ALUop),   
	    .ALUSrc_o(ALUSrc),   
	    .RegDst_o(RegDst),   
		 .Branch_o(Branch),   
		 .Jump_o(Jump),		
		 .MemWrite_o(MemWrite),
		 .MemRead_o(MemRead),
		 .MemtoReg_o(MemtoReg)


		);

Sign_Extend Sign_Extend(
        .data_i(instruction_reg[16-1:0]),
        .data_o(SE_out)
		);	

Pipe_Reg_ID #(.size(32)) ID_EX(
         .clk_i(clk_i1),
		  
         .data_i_ALUop(ALUop),
	      .data_i_RegWrite(RegWrite),
	      .data_i_ALUSrc(ALUSrc),
	      .data_i_RegDst(RegDst),
	      .data_i_Branch(Branch),
	      .data_i_Jump(Jump),
	      .data_i_MemWrite(MemWrite),
	      .data_i_MemRead(MemRead),
	      .data_i_MemtoReg(MemtoReg),
					
         .data_i_add(SUM_0_reg),
         .data_i_RSdata(RSdata),
         .data_i_RTdata(RTdata),
         .data_i_SE_OUT(SE_out),
			
         .data_i_RS(instruction_reg[25:21]),			
         .data_i_RT(instruction_reg[20:16]),
         .data_i_RD(instruction_reg[15:11]),
			
			
			.data_o_ALUop(ALUop_reg),
	      .data_o_RegWrite(RegWrite_reg),
	      .data_o_ALUSrc(ALUSrc_reg),
	      .data_o_RegDst(RegDst_reg),
	      .data_o_Branch(Branch_reg),
	      .data_o_Jump(Jump_reg),
	      .data_o_MemWrite(MemWrite_reg),
	      .data_o_MemRead(MemRead_reg),
	      .data_o_MemtoReg(MemtoReg_reg),
					
         .data_o_add(SUM_0_reg_reg),
         .data_o_RSdata(RSdata_temp),
         .data_o_RTdata(RTdata_temp),
         .data_o_SE_OUT(SE_out_reg),
			
			.data_o_RS(RS_reg),
         .data_o_RT(RT_reg),
         .data_o_RD(RD_reg)


		);
		
//Instantiate the components in EX stage	   
ALU ALU(
       .src1_i(RSdata_reg),
	    .src2_i(Mux_ALUSrc_out),
	    .ctrl_i(AC_out),
	    .result_o(ALU_out),
		 .zero_o(Zero)
   
		);
		
ALU_Ctrl ALU_Control(
       .funct_i(SE_out_reg[5:0]),   
       .ALUOp_i(ALUop_reg),   
       .ALUCtrl_o(AC_out) 

		);

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(RTdata_reg),
        .data1_i(SE_out_reg),
        .select_i(ALUSrc_reg),
        .data_o(Mux_ALUSrc_out)

        );
		
MUX_2to1 #(.size(5)) Mux_RegDst(
        .data0_i(RT_reg),
        .data1_i(RD_reg),
        .select_i(RegDst_reg),
        .data_o(Mux_RegDst_out)

        );
		  
Shift_Left_Two_32 Shifter(
        .data_i(SE_out_reg),
        .data_o(Shifter_out)
        ); 			  

Adder Adder2(
       .src1_i(SUM_0_reg_reg),     
	    .src2_i(Shifter_out),     
	    .sum_o(SUM_1)      
	    );		  

Pipe_Reg_EX #(.size(32)) EX_MEM(
               .clk_i(clk_i1),
					
					.data_i_RegWrite(RegWrite_reg),
										
					.data_i_Branch(Branch_reg),
					.data_i_Jump(Jump_reg),
					.data_i_MemWrite(MemWrite_reg),
					.data_i_MemRead(MemRead_reg),
					.data_i_MemtoReg(MemtoReg_reg),
					
					.data_i_add_branch(SUM_1),
					.data_i_Zero(Zero),
					.data_i_ALUout(ALU_out),
					.data_i_RT_data(RTdata_reg),
					.data_i_Write(Mux_RegDst_out),
					.EX_flush(EX_flush),
		
					.data_o_RegWrite(RegWrite_reg_reg),
					.data_o_Branch(Branch_reg_reg),
					.data_o_Jump(Jump_reg_reg),
					.data_o_MemWrite(MemWrite_reg_reg),
					.data_o_MemRead(MemRead_reg_reg),
					.data_o_MemtoReg(MemtoReg_reg_reg),
					
					.data_o_add_branch(SUM_1_reg),
					.data_o_Zero(Zero_reg),
					.data_o_ALUout(ALU_out_reg),
					.data_o_RT_data(RTdata_reg_reg),
					.data_o_Write(Mux_RegDst_out_reg)


		);
			   
//Instantiate the components in MEM stage

/*Branch_1 BR(
     .src1_i(Branch_reg_reg),
	  .src2_i(Zero_reg),

	  .result_o(pc_mux_control)
);*/



Data_Memory Data_Memory(
   .clk_i(clk_i1),
	.addr_i(ALU_out_reg),
	.data_i(RTdata_reg_reg),
	.MemRead_i(MemRead_reg_reg),
	.MemWrite_i(MemWrite_reg_reg),
	.data_o(final)

	    );

Pipe_Reg_MEM #(.size(32)) MEM_WB(

               .clk_i(clk_i1),
					.data_i_RegWrite(RegWrite_reg_reg),
					.data_i_MemtoReg(MemtoReg_reg_reg),
					.data_i_final(final),
					.data_i_ALU_out(ALU_out_reg),
					.data_i_WriteReg(Mux_RegDst_out_reg),
					
					
					.data_o_RegWrite(RegWrite_reg_reg_reg),
					.data_o_MemtoReg(MemtoReg_reg_reg_reg),
					.data_o_final(final_reg),
					.data_o_ALU_out(ALU_out_reg_reg),
					.data_o_WriteReg(Mux_RegDst_out_reg_reg)

        
		);

//Instantiate the components in WB stage
MUX_3to1 #(.size(32)) Mux3(
      .data0_i(ALU_out_reg_reg),
      .data1_i(final_reg),
      .select_i(MemtoReg_reg_reg_reg),
      .data_o(last_final)
 

        );
		  
		  
// Forwarding Unit

forwardingunit  forwatding_unit(

     .EX_MEM_RegWrite_i(RegWrite_reg_reg),
	  .MEM_WB_RegWrite_i(RegWrite_reg_reg_reg),
		
	  .EX_MEM_RegRd_i(Mux_RegDst_out_reg),
     .MEM_WB_RegRd_i(Mux_RegDst_out_reg_reg),
		
	  .ID_EX_RegRs_i(RS_reg),
	  .ID_EX_RegRt_i(RT_reg),
		
		
	  .Forward_A_o(MUX_A),
	  .Forward_B_o(MUX_B)


);

hazard_dection hazard_dection(

       .ID_EX_MemRead_i(MemRead_reg),
		 .ID_EX_RegRt_i(RT_reg),
		 .IF_ID_RegRs_i(instruction_reg[25:21]),
		 .IF_ID_RegRt_i(instruction_reg[20:16]),
		 .branch(pc_mux_control),
		 
		 .IF_flush_o(IF_flush),
		 .PC_Write_o(PC_Write),
		 .ID_flush_o(ID_flush),
		 .EX_flush_o(EX_flush),
		 .IF_Write_o(IF_Write)


);

MUX_2to1 #(.size(6)) hazard_dection_mux(
        .data0_i(instruction_reg[31:26]),
        .data1_i(32),   //傳32告訴decoder要把所有control flush掉(32原本未編碼)
        .select_i(ID_flush),
        .data_o(control_input)

        );
		  
mux_3to1  MuxA(
       .data0_i(RSdata_temp),
		 .data1_i(ALU_out_reg),
		 .data2_i(last_final),

      // .data2_i(RegWrite_reg_reg_reg),
		 .select_i(MUX_A),
		 .data_o(RSdata_reg)

);	

mux_3to1  MuxB(
       .data0_i(RTdata_temp),
		 .data1_i(ALU_out_reg),
       .data2_i(last_final),
		 .select_i(MUX_B),
		 .data_o(RTdata_reg)

);		  
		  
 

/****************************************
signal assignment
****************************************/	
endmodule

