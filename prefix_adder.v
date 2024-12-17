module prefix_adder #(parameter LEVELS = 3, parameter WIDTH = 2**LEVELS) (x, y, carry_in, z, carry_out);

    input wire[WIDTH - 1 : 0] x;
    input wire[WIDTH - 1 : 0] y;
    input carry_in;

    output wire[WIDTH - 1 : 0] z;
    output carry_out;

    wire[WIDTH - 1 : 0] gen;
    wire[WIDTH - 1 : 0] prop;

    wire[WIDTH - 1 : 0] carry;

    generate
        genvar i;
        for (i = 0; i < WIDTH; i = i + 1) begin
            assign prop[i] = x[i] ^ y[i];
            assign gen[i] = x[i] & y[i];
        end
    endgenerate

    carry_gen #(.LEVELS(LEVELS), .WIDTH(WIDTH)) c
    (
        .c_in(carry_in),
        .gen_in(gen),
        .prop_in(prop),
        .carry(carry),
        .c_out(carry_out)
    );

    generate
        genvar j;
        for (j = 0; j < WIDTH; j = j + 1)
            assign z[j] = prop[j] ^ carry[j];
    endgenerate

endmodule

module carry_gen #(parameter LEVELS = 3, parameter WIDTH = 2**LEVELS)
(
    input c_in,
    input wire[WIDTH - 1 : 0] gen_in,
    input wire[WIDTH - 1 : 0] prop_in,
    output wire[WIDTH - 1 : 0] carry,
    output c_out
);
    wire[WIDTH : 0] gen_t[LEVELS : 0];
    wire[WIDTH : 0] prop_t[LEVELS : 0];

    assign gen_t[0] = {gen_in, c_in};
    assign prop_t[0] = {prop_in, c_in};

    generate
        genvar i, j;
        for (i = 0; i < LEVELS; i = i + 1) begin: stage
            for (j = 0; j <= WIDTH; j = j + 1) begin: block
                if ((j / 2**i) % 2 == 1) begin
                    assign gen_t[i + 1][j] = gen_t[i][j] | prop_t[i][j] & gen_t[i][(j / 2**i) * 2**i - 1];
                    assign prop_t[i + 1][j] = prop_t[i][j] & prop_t[i][(j / 2**i) * 2**i - 1];
                end else begin
                    assign gen_t[i + 1][j] = gen_t[i][j];
                    assign prop_t[i + 1][j] = prop_t[i][j];
                end
            end
        end
    endgenerate

    assign carry = gen_t[LEVELS][WIDTH - 1 : 0];
    assign c_out = gen_t[LEVELS][WIDTH] | prop_t[LEVELS][WIDTH] & gen_t[LEVELS][WIDTH - 1];
endmodule

