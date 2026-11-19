# code for jkff.v
  ...
     module jkff(j,k,clk,rst,q,qb);
        input j,k,clk,rst;
        output reg q;
        output qb;

        /*parameter HOLD=2'b00;
        parameter RESET=2'b01;
   parameter SET=2'b10;
        parameter TOGGLE=2'b11;*/

        parameter
                        HOLD=2'b00,
                        RESET=2'b01,
                        SET=2'b10,
                        TOGGLE=2'b11;

        always@(posedge clk)
                if(rst)
                begin
                        q<=1'b0;
                end
                else
                begin
                        case({j,k})
                                HOLD: q <= q;
                                RESET: q <= 0;
                                SET: q <= 1;
                                TOGGLE: q <= ~q;
                        endcase
                end
                assign qb=~q;
                endmodule
...
