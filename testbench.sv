module testbench;

  logic arst;
  logic ck;
  logic scl;
  logic sdai;
  logic sdao;

  initial begin
    arst = 1;
    ck = 0;
    #5us;
    arst = 0;

    #100us $stop;
  end

  always #2us ck = ~ck;


  i2c_master u_i2c_master(
    .arst(arst),
    .ck(ck),
    .scl(scl),
    .sdai(sdai),
    .sdao(sdao)
  );



endmodule

