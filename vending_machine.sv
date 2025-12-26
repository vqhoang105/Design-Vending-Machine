module vending_machine (input logic nickle, 
                        input logic dime, 
                        input logic quarter,
                        input logic clk, 
                        input logic reset_n,
                        output logic soda, 
                        output logic [2:0] change);
 
  //State
  typedef enum logic [3:0] {S0, S5, S10, S15, S20, S25, S30, S35, S40} state;
  state current, next;

  always_comb begin
    case (current) 
      S0: begin
        if (!(nickle|dime|quarter)) next = current;
        else if (nickle) 			next = S5;
        else if (dime)				next = S10;
        else  						next = S25;
      end
      S5: begin
     if (!(nickle|dime|quarter)) next = current;
        else if (nickle) 			next = S10;
        else if (dime)				next = S15;
        else  						next = S30;
      end
      S10: begin
         if (!(nickle|dime|quarter)) next = current;
        else if (nickle) 			next = S15;
        else if (dime)				next = S20;
        else  						next = S35;
      end
      S15: begin
        if (!(nickle|dime|quarter)) next = current;
        else if (nickle) 			next = S20;
        else if (dime)				next = S25;
        else  						next = S40;
      end
      S20:      						next = S0;
      S25:						    	next = S0;
      S30: 								next = S0;
      S35: 								next = S0;
      S40: 								next = S0;
 default: next = S0;
    endcase
  end
  
  always_ff @(posedge clk) begin
    if (!reset_n) current <= S0;
    else current <= next;
  end
  
  always_comb begin
    case (current)
      S0: begin
        soda = 1'b0;
        change =3'b000;
      end
      S5: begin
        soda = 1'b0;
        change = 3'b000;
      end
      S10: begin
 		soda = 1'b0;
        change = 3'b000;
      end
      S15: begin
        soda = 1'b0;
        change = 3'b000;
      end
      S20: begin
        soda = 1'b1;
        change = 3'b000;
      end
       S25: begin
         soda = 1'b1;
         change = 3'b001;
       end
        S30: begin
          soda = 1'b1;
         change = 3'b010;
        end
      S35: begin
        soda = 1'b1;
        change = 3'b011;
      end
        S40: begin
          soda = 1'b1;
          change = 3'b100;
        end
      default begin
        soda = 1'b0;
        change = 3'b000;
      end
    endcase
  end
 
  
endmodule
         
      
