module tb_spi_top;
  reg clk, rst, start;
  reg [7:0] master_tx_data, slave_tx_data;
  wire [7:0] master_rx_data, slave_rx_data;
  wire spi_done, slave_done;
  
  spi_top #(.clk_freq(100), .spi_freq(10)) dut(.clk(clk), .rst(rst), .start(start), 
              .master_tx_data(master_tx_data), .slave_tx_data(slave_tx_data),
              .master_rx_data(master_rx_data), .slave_rx_data(slave_rx_data),
              .spi_done(spi_done), .slave_done(slave_done));
  
  always #10 clk = ~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    start = 0;
    master_tx_data = 8'b11010101;
    slave_tx_data = 8'b10110110;
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
    if(spi_done && slave_done) begin
      if((master_rx_data == slave_tx_data) && (slave_rx_data == master_tx_data))
         $display("PASS: Master RX=%b Slave RX=%b", master_rx_data, slave_rx_data);
      else
        $display("FAIL: Master RX=%b Slave RX=%b", master_rx_data, slave_rx_data);
    end
  end
         
endmodule