module tb_spi_master;
  reg clk, rst, start;
  reg [7:0] tx_data;
  wire [7:0] rx_data;
  wire sclk, mosi, cs, spi_done, miso;
  
  assign miso = mosi;
  
  spi_master #(.clk_freq(100), .spi_freq(10)) dut(.clk(clk), .rst(rst), .start(start), .miso(miso), .tx_data(tx_data), .rx_data(rx_data), .sclk(sclk), .mosi(mosi), .cs(cs), .spi_done(spi_done));
  
  always #10 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    start = 0;
    tx_data = 8'b10110010;
    #50;
    rst = 0;
    #50;
    start = 1;
    #20;
    start = 0;
    #2000;
    $finish;
  end
  
  always @(posedge clk) begin
    if(spi_done) begin
      if(rx_data == tx_data)
        $display("PASS: TX=%b RX=%b", tx_data, rx_data);
      else
        $display("FAIL: TX=%b RX=%b", tx_data, rx_data);
    end
  end
endmodule