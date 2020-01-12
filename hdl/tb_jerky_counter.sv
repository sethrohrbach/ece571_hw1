//////////////////////////////////////////////////////
// tb_jerky_counter.sv - A testbench for a counter following a specified pattern for ECE571 HW#1
//
// Author: Seth Rohrbach
// Date: January 11th, 2020
//
// --------------
// Description:
// Simple testbench for the jerky counter for ECE571 HW#1 Winter 2020.
// Basically just a clock and some print commands.
//
//////////////////////////////////////////////////////////



module tb_jerky_counter;

parameter CLK_PERIOD = 10; //Clock period shall be 10 time units.

bit clk = 1'b0; //System clock
bit rst = 1'b0;
bit [7:0] count_out;

//Instantiate the DUT - Jerky counter.

jerky_counter DUT
(
  .clock(clk),
  .reset(rst),
  .count(count_out)
);

//System clock:
always
begin
  #(CLK_PERIOD / 2) clk = ~clk;
  //Printing out the count so we can see it working.
  $monitor("t = %3d, count = %d", $time, count_out);
end

initial
begin
$display("Simulation begins...");


//Just threw in some resets so we can see that it does in fact reset.
#20 rst = 1;
#25 rst = 0;

#80 rst = 1;
#90 rst = 0;

end
endmodule
