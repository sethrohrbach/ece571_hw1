//////////////////////////////////////////////////////
// alu_regfile.sv - The DUT for the ALU module and provided REGFILE for ECE571 HW#1
//
// Author: Seth Rohrbach
// Date: January 10th, 2020
//
// Description:
// Instantiates a regfile module and 8 bit ALU module for ECE 571
// To be used with the provided test bench.
//
//
//////////////////////////////////////////////////////////







import ALU_REGFILE_Defs::*;

module alu_regfile (
  // register file interface
  input logic [REGFILE_ADDR_WIDTH-1:0]  Read_Addr_1,  // read port addresses
                                        Read_Addr_2,

  input logic [REGFILE_ADDR_WIDTH-1:0]  Write_Addr,   // write port address
  input logic                           Write_enable, // write enable (1 to write)
  input logic [REGFILE_WIDTH-1:0]       Write_data,   // data to write into the register file

  // ALU interface. Data to the ALU comes from the register file
  input logic                           Carry_In,     // Carry In
  input aluop_t                         Opcode,       // operation to perform
  output logic [ALU_OUTPUT_WIDTH-1:0]   ALU_Out,      //ALU result
  // system-wide signals
  input  logic Clock                                  // system clock
);

logic [ALU_INPUT_WIDTH-1:0] A_data, B_data;

//Instantiate register file and ALU:
register_file rf0(A_data, B_data, ALU_Out, Read_Addr_1, Read_Addr_2, Write_Addr, Write_enable, Write_data);

alu alu0(A_data, B_data, Carry_In, Opcode, ALU_Out);
