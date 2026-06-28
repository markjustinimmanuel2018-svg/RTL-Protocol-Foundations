module tb_uart_tx;
  
  reg clk, rst, tx_start;
  reg [7:0] tx_data;
  
  wire tx, tx_busy;
  
  uart_transmit #(.clk_freq(100), .baud_rate(10)) dut(.clk(clk), .rst(rst), .tx_start(tx_start), .tx_data(tx_data), .tx(tx), .tx_busy(tx_busy));
  
  always #10 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    tx_start = 0;
    tx_data = 8'b11010101;
    #50;
    rst = 0;
    #50;
    tx_start = 1;
    #20;
    tx_start = 0;
    #200000;
    $finish;
  end
endmodule