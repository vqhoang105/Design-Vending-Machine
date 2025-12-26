`timescale 1ns/1ps

module vendingmachine_tb;
  logic clk;
  logic nickle;
  logic reset_n;
  logic quarter;
  logic dime;
  logic soda;
  logic [2:0] change;
  
  vending_machine dut(.clk(clk),
    .reset_n(reset_n),
    .nickle(nickle),
     .dime(dime),
    .quarter(quarter),
    .soda(soda),
    .change(change)
  );
  
  always #5 clk=!clk;
  
  initial begin
    $dumpfile("vendingmachine_tb.vcd");
    $dumpvars(0, vendingmachine_tb);
    
    clk=0;
    reset_n=0;
    nickle = 0;
    dime = 0;
    quarter = 0;
   
    #10 reset_n = 0;
    #10 reset_n = 1;
    @(posedge clk) dime = 1;
    @(posedge clk)dime =0;
    @(posedge clk) quarter = 1;
    @(posedge clk) quarter = 0;
    @(posedge clk) nickle = 1;
     @(posedge clk)nickle = 0;
    dime = 1;
    @(posedge clk) dime = 0;
    quarter = 1;
    @(posedge clk) quarter = 0;
    
    #20 
    $finish;
  end
endmodule
