module spi_slave(input rst, cs, sclk, mosi, input [7:0] tx_data, output reg miso, rx_done, output reg [7:0] rx_data);
  
  reg [7:0] tx_shift_reg, rx_shift_reg;
  reg [2:0] bit_count;
  
  // Transaction Start
  
  always @(negedge cs or posedge rst) begin
    if(rst) begin
      tx_shift_reg <= 0;
      rx_shift_reg <= 0;
      bit_count <= 0;
      rx_done <= 0;
    end
    else begin
      tx_shift_reg <= tx_data << 1;
      miso <= tx_data[7];
      rx_shift_reg <= 0;
      bit_count <= 0;
      rx_done <= 0;
    end
  end
  
  // Receive MOSI
  
  always @(posedge sclk or posedge rst) begin
    if(rst) begin
      rx_data <= 0;
      rx_done <= 0;
    end
    else if(!cs) begin
      rx_shift_reg <= {rx_shift_reg[6:0], mosi};
      if(bit_count == 3'b111) begin
        bit_count <= 0;
        rx_data <= {rx_shift_reg[6:0], mosi};
        rx_done <= 1;
      end
      else begin
      rx_done <= 0;
        bit_count <= bit_count + 1;
      end
    end
  end
  
  // Transmit MISO 
  
  always @(negedge sclk or posedge rst) begin
    if(rst)
      miso <= 0;
    else if(!cs) begin
      miso <= tx_shift_reg[7];
      tx_shift_reg <= tx_shift_reg << 1;
    end
  end
 
endmodule