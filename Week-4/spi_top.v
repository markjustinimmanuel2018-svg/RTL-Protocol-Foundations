module spi_top #(parameter clk_freq = 50_000_000,
                 parameter spi_freq = 1_000_000)
                 (input clk, rst, start,
                  input [7:0] master_tx_data, slave_tx_data,
                  output [7:0] master_rx_data, slave_rx_data,
                  output spi_done, slave_done);
  
  wire sclk, cs, mosi, miso;
  
  spi_master #(.clk_freq(clk_freq), .spi_freq(spi_freq)) 
  master(.clk(clk), .rst(rst), .start(start), .tx_data(master_tx_data), .miso(miso),
         .rx_data(master_rx_data), .mosi(mosi), .sclk(sclk), .cs(cs), .spi_done(spi_done));
  
  spi_slave slave(.rst(rst), .cs(cs), .sclk(sclk), .mosi(mosi),
                  .tx_data(slave_tx_data), .rx_data(slave_rx_data),
                  .miso(miso), .rx_done(slave_done));
  
endmodule