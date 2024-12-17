module jk_trigger(
  input j, k, clock,
  output q, q_bar
);

  wire and_g1, and_g2, nand_g3, nand_g4;

  and g1(and_g1, j, clock);
  and g2(and_g2, k, clock);
  nand g3(nand_g3, and_g1, and_g1);
  nand g4(nand_g4, and_g2, and_g2);
  nand g5(q, nand_g3, q_bar);
  nand g6(q_bar, nand_g4, q);
endmodule

module d_trigger(
  input d, clock,
  output q, q_bar
);

  wire not_g1;
  
  not g1(not_g1, d);
  jk_trigger jk(
    .j(d),
    .clock(clock),
    .k(not_g1),
    .q(q),
    .q_bar(q_bar)
  );
endmodule