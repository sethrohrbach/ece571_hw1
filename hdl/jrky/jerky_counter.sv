//////////////////////////////////////////////////////
// jerky_counter.sv - A counter following a specified pattern for ECE571 HW#1
//
// Author: Seth Rohrbach
// Date: January 11th, 2020
//
// -------------------
// Description: An 8 bit counter with 14 steps. The count advances bit by bit
// from LSB to MSB, and every odd step returns to the LSB.
// e.g.: 1, 2, 1, 4, 1, 8, 1, 16, 1, 32, 1, 64, 1, 128
//
//////////////////////////////////////////////////////////

module jerky_counter (
  input  logic       clock, reset, //clock and reset signals
  output logic [7:0] count    //counter output
  );

  //We will track the next state and previous state to keep the count.
  logic [7:0] current;
  logic [7:0] next;
  logic [7:0] prev;

//Starting the count. Reset is the same. We made the reset asynchronous cause not specified.
initial
begin
current = 1;
next = 2;
prev = 128;
end

always @(reset)
begin
current = 1;
next = 2;
prev = 128;
end

//Next count logic:
always @(posedge clock)
begin
  if (current == 1) //If we are at 1, we need to check what the previous count was.
  begin
    if (prev == 128) //If prev was 128, we need to wrap around.
    begin
    next <= 2;
    prev <= current;
    end
    else //Else prev was not 128 and we can just assign next = 2* prev.
    begin
      next <= 2*prev;
      prev <= current;
    end
  end
  else //Else the next count is 1. Remember the current count.
  begin
    next <= 1;
    prev <= current;
  end
end

//Updating the output
always @(next)
begin
  current = next;
  count = current;
end


endmodule
