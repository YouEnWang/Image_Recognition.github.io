module Encoder_tb();
  reg [31:0] data_in;
  wire [31:0] data_out;
  wire [4:0] do_XOR;
  wire [4:0] counter1,counter2,i,j,h,n,M;
  
  Encoder En(
    .data_in(data_in),
    .data_out(data_out),
    .do_XOR(do_XOR),
    .counter1(counter1),
    .counter2(counter2),
    .i(i),
    .j(j),
    .h(h),
    .n(n),
    .M(M)
  );
  
  initial begin
    data_in =  8'b10101101;
    #4;
  end
  
  initial begin
    $dumpfile("En.vcd");
    $dumpvars;
    #16;
    $display("TEST START");
    $display("The input codes you enter are:%b", data_in);
    $display("The Hamming code:%b", do_XOR);
    $display("The output codes are:%b", data_out);
//     $display("The output codes:%b", data_out[0]);
//     $display("The :%b", do_XOR[4]);
    $display("TEST FINISH");
    $finish;
  end
endmodule  
