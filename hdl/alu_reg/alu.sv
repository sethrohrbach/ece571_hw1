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

//We use this to set the MSB for logical ops to 0.
bit zero = 1'b0;

always @(*)
  begin
    case (Opcode)
      3'b000: ALU_Out = A_In + B_In + Carry_In;
      3'b001: ALU_Out = A_In + ~B_In + Carry_In;
      3'b010: ALU_Out = ~A_In + B_In + ~Carry_In;
      3'b011: ALU_Out[ALU_OUTPUT_WIDTH-1:0] = {zero, (A_In | B_In)};
      3'b100: ALU_Out[ALU_OUTPUT_WIDTH-1:0] = {zero, (A_In & B_In)};
      3'b101: ALU_Out[ALU_OUTPUT_WIDTH-1:0] = {zero, (~A_In & B_In)};
      3'b110: ALU_Out[ALU_OUTPUT_WIDTH-1:0] = {zero, A_In ^ B_In)};
      3'b111: ALU_Out[ALU_OUTPUT_WIDTH-1:0] = {zero, (A_In ~^ B_In)};
    endcase
  end

endmodule
