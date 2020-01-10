ECE 571 Winter 2020
Homework #1 Release (version 1.1)
---------------------------------------------

This assignment replaces the assignment that was posted on January 8th.  The changes are minor but there are some improvements.

PROBLEM #1
------
o Removed the initial block in register_file.sv that sets all of the locations.  The functionality is implemented in a the task initialize_regfile() in tb_alu_regfile.sv.
Cleaned up to code by using always__ff instead of an always block.   The original used an always block becuase the contents of the regfile memory were being
written in both the intiial block and the always block.  A no-no for an always_ff block...and rightly so.

o Added a task called initialize_regfile(initial_value) which writes the entire array with "initialvalue" to tb_aluregfile.sv.

o Enhanced the functionality of the ALU test in the testbench.  Testbench now writes the alu results to the memory and then dumps the contents. 
The test is still rudimentary but now we close the loop w/ the results being writen to the register file.

Enjoy
Roy