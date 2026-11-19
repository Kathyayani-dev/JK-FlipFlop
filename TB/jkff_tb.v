# code for  jkff_tb.v
  ...
     module jkff_tb();
        reg j,k,clk,rst;
        wire q,qb;

        integer i;

        parameter CYCLE=10;

        jkff DUT(j,k,clk,rst,q,qb);

        always
        begin
                #(CYCLE/2);
                clk=1'b0;
                #(CYCLE/2);
                clk=1'b1;
        end

        task rst_dut();
                begin
                        @(negedge clk);
                        rst=1'b1;
                        @(negedge clk);
                        rst=1'b0;
                end
        endtask

        task initialize;
                begin
                        {j,k}=0;
                end
        endtask

        task stimulus(input [1:0]a);
                begin
                        @(negedge clk);
                        {j,k}=a;
                end
        endtask

        task delay;
           begin
                        #100;
           end
        endtask

        initial
        begin
                initialize;
                rst_dut;
                for(i=0;i<4;i=i+1)
                begin
                        stimulus(i);
                        delay;
                end
        end

        initial
                $monitor("j=%b, k=%b, q=%b, qb=%b",j,k,q,qb);
        endmodule
...
