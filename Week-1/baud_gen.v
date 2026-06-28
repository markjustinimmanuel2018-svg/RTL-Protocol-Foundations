module baud_gen #( parameter clk_freq = 50000000,
  parameter baud_rate = 9600)(
  input clk, rst, output reg baud_tick);
  
  localparam DIV = clk_freq / baud_rate;
  reg [$clog2(DIV)-1:0] count;
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      count <= 0;
      baud_tick <= 0;
    end
    else begin
      if(count == DIV - 1) begin
        count <= 0;
        baud_tick <= 1;
      end
      else begin
        count <= count + 1;
        baud_tick <= 0;
      end
    end
  end
endmodule