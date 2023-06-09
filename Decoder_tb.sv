// testbench
module Decoder_tb();
  reg [31:0] data_in;
  wire [31:0] data_out;
  wire [5:0] do_XOR;
  wire [5:0] M;
  	
  Decoder De(
    .data_in(data_in),
    .data_out(data_out),
    .do_XOR(do_XOR),
    .M(M)
    );
  
  initial begin
    data_in = 32'b01010101010010010101101010111011;		// input_data_1
//     data_in = 32'b01110000111100001111000011110011;		// input_data_2
//     data_in = 32'b01010101010010010101101010010011;		// input_data_3
    #4;
    $dumpfile("De.vcd");
    $dumpvars;
    #16;				
    $display("TEST START");
    $display("The input codes you enter are:%b", data_in);
    $display("The position of a specific error code:%d", do_XOR);
    $display("The output codes are:%b", data_out);

    $display("TEST FINISH");
    $finish;
  end

endmodule   
