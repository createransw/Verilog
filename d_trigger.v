module d_trigger(clock, d, q, q_bar);
    input clock, d;
    output q, q_bar;

    wire d_bar;
    not n(d_bar, d);

    wire layer_1_up, layer_1_down;

    nand up_1(layer_1_up, d, clock);
    nand down_1(layer_1_down, d_bar, clock);

    nand up_2(q, layer_1_up, q_bar);
    nand down_2(q_bar, layer_1_down, q);

endmodule
