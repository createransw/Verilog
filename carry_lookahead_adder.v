module carry_lookahead_adder #(parameter WIDTH = 8) (x, y, carry_in, z, carry_out);

    input wire[WIDTH - 1 : 0] x;
    input wire[WIDTH - 1 : 0] y;
    input carry_in;

    output wire[WIDTH - 1 : 0] z;
    output carry_out;

    wire[WIDTH - 1 : 0] gen;
    wire[WIDTH - 1 : 0] prop;

    wire[WIDTH : 0] carry;

    generate
        genvar i;
        for (i = 0; i < WIDTH; i = i + 1) begin
            assign prop[i] = x[i] ^ y[i];
            assign gen[i] = x[i] & y[i];
            if (i == 0)
                assign carry[i] = carry_in;
            else
                assign carry[i] = gen[i - 1] | prop[i - 1] & carry[i - 1];
        end
    endgenerate

    assign carry[WIDTH] = gen[WIDTH - 1] | prop[WIDTH - 1] & carry[WIDTH - 1];

    generate
        genvar j;
        for (j = 0; j < WIDTH; j = j + 1)
            assign z[j] = prop[j] ^ carry[j];
    endgenerate

    assign carry_out = carry[WIDTH];

endmodule

