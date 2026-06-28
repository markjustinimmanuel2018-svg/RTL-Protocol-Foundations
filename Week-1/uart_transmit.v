module uart_transmit #(parameter clk_freq = 50000000,
                       parameter baud_rate = 9600)(
  input clk, rst, tx_start,
  input [7:0] tx_data,
  output tx, tx_busy);
  
  wire baud_tick;
  
  baud_gen #(.clk_freq(clk_freq), .baud_rate(baud_rate)) baud(.clk(clk), .rst(rst), .baud_tick(baud_tick));
  
  uart_tx transmit(.clk(clk), .rst(rst), .baud_tick(baud_tick), .tx_start(tx_start), .tx_data(tx_data), .tx(tx), .tx_busy(tx_busy));
  
endmodule