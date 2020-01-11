//////////////////////////////////////////////////////
// alu_mod.sv - The module for the 8 bit ALU for ECE571 HW#1 Problem 1
//
// Author: Seth Rohrbach
// Date: January 10th, 2020
//
// Description:
// Implements an 8 bit ALU, with the following ops:
// 000 : add        : a + b + c_in
// 001 : subtract   : a + ~b + c_in
// 010 : subtract_a : ~a + b + ~c_in
// 011 : or_ab      :
// 100 : and_ab     :
// 101 : not_ab     :
// 110 : exor       :
// 111 : exnor      :
//
//////////////////////////////////////////////////////////

import ALU_REGFILE_Defs::*;

module alu (
  input logic [ALU_INPUT_WIDTH-1:0] A_In, B_In, // A and B operands
  input logic Carry_In, // Carry In
  input aluop_t Opcode, // operation to perform
  output logic [ALU_OUTPUT_WIDTH-1:0] ALU_Out // ALU result(extended by 1 bit to preserve Carry_Out from Sum/Diff)

);

always_comb @(*)
  begin
    unique case (Opcode)
      ADD_OP:   ALU_Out = A_in + B_in + Carry_in;
      SUB_OP:   ALU_Out = A_in + ~B_in + Carry_in;
      SUBA_OP:  ALU_Out = ~A_in + B_in + ~Carry_in;
      ORAB_OP:  ALU_Out = A_in | B_in;
      ANDAB_OP: ALU_Out = A_in & B_in;
      NOTAB_OP: ALU_Out = ~A_in & B_in;
      EXOR_OP:  ALU_Out = A_in ^ B_in;
      EXNOR_OP: ALU_Out = A_in ~^ B_in;
    endcase
  end

endmodule
