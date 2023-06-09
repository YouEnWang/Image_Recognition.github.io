// Decoder
// main design code
module Decoder(data_in, data_out, do_XOR, M);
  input [31:0] data_in;
  output [31:0] data_out;
  output [5:0] do_XOR;			// 用6位
  output [5:0] M;
    
  reg [31:0] data_out = 32'd0;
  reg [5:0] place_of_1 [31:0];
  reg [5:0] counter = 6'd0;		// 計數用
  reg [5:0] i = 6'd0;		// 計數用
  reg [5:0] j = 6'd0;		// 計數用
  reg [5:0] M = 6'd0;
  reg [5:0] do_XOR = 6'd0;

  initial begin
    // 計算M: input有幾個bit
    // 把input先放進output內
    while(i < 2**M) begin
      data_out[M] = data_in[M];
      M = M + 6'd1;
    end
    
    // 將output內目前所有為1的位置放進place_of_1
    // 存入的值會是二進位表示
    while(i < M) begin
      if(data_in[M-i-1] == 1) begin
        place_of_1[counter] = i;
        counter = counter + 1;
      end
      i = i + 1;
    end
    
    // 將place_of_1內存的每個二進位值做XOR
    while(j < counter) begin
      do_XOR = do_XOR ^ place_of_1[j];
      j = j + 1;
    end
    
	do_XOR = do_XOR + 6'd1;
    
    // 若do_XOR非0，則表示有error
    // 將error bit做invertor
    if(do_XOR != 6'd0) begin
      data_out[M - do_XOR] = ~data_out[M - do_XOR];
    end
  end
endmodule
