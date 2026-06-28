
module spi_master(input clk, rst, start, miso,
                  input [7:0] tx_data,
                  output reg [7:0] rx_data,
                  output reg sclk, mosi, cs, spi_done);
  
  localparam IDLE = 2'b00, LOAD = 2'b01, TRANSFER = 2'b10, DONE = 2'b11;
  
  parameter clk_freq = 50000000, spi_freq = 1000000;
  
  localparam DIV = clk_freq/spi_freq;
  
  reg [1:0] state;
  reg [7:0] tx_shift_reg, rx_shift_reg;
  reg [2:0] bit_count;
  reg [$clog2(DIV)-1:0] clk_count;
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      state <= IDLE;
      sclk <= 0;
      cs <= 1;
      mosi <= 0;
      spi_done <= 0;
      rx_data <= 0;
      tx_shift_reg <= 0;
      rx_shift_reg <= 0;
      bit_count <= 0;
      clk_count <= 0;
    end
    else begin
      case(state)
        IDLE: begin
          sclk <= 0;
          cs <= 1;
          spi_done <= 0;
          bit_count <= 0;
          clk_count <= 0;
          if(start)
            state <= LOAD;
        end
        LOAD: begin
          cs <= 0;
          rx_shift_reg <= 0;
          bit_count <= 0;
          clk_count <= 0;
          mosi <= tx_data[7];
          tx_shift_reg <= tx_data << 1;
          state <= TRANSFER;
        end
        TRANSFER: begin
          if(clk_count == (DIV/2)-1) begin
            clk_count <= 0;
            sclk <= ~sclk;
            if(sclk == 0) begin
              rx_shift_reg <= {rx_shift_reg[6:0], miso};
              if(bit_count == 3'b111)
                state <= DONE;
              else
                bit_count <= bit_count + 1;
            end
            else begin
              mosi <= tx_shift_reg[7];
              tx_shift_reg <= tx_shift_reg << 1;
            end
          end
          else
            clk_count <= clk_count + 1;
        end
        DONE: begin
          cs <= 1;
          sclk <= 0;
          rx_data <= rx_shift_reg;
          spi_done <= 1;
          state <= IDLE;
        end
      endcase
    end
  end
endmodule