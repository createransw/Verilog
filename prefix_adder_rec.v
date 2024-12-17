module prefix_adder #(parameter LEVELS = 3, parameter WIDTH = 2**LEVELS) (x, y, carry_in, z, carry_out);

    input wire[WIDTH - 1 : 0] x;
    input wire[WIDTH - 1 : 0] y;
    input carry_in;

    output wire[WIDTH - 1 : 0] z;
    output carry_out;

    wire[WIDTH : 0] carry;

    assign carry[0] = carry_in;

    generate
        if (LEVELS == 0)
            assign {carry_out, z} = x + y + carry_in;
        else begin
            wire tmp_c_in;
            prefix_adder #(.LEVELS(LEVELS - 1), .WIDTH(WIDTH / 2)) a
            (
                .x(x[WIDTH / 2 - 1 : 0]),
                .y(y[WIDTH / 2 - 1 : 0]),
                .carry_in(carry_in),
                .z(z[WIDTH / 2 - 1 : 0]),
                .carry_out(tmp_c_in)
            );

            prefix_adder #(.LEVELS(LEVELS - 1), .WIDTH(WIDTH / 2)) b
            (
                .x(x[WIDTH - 1 : WIDTH / 2]),
                .y(y[WIDTH - 1 : WIDTH / 2]),
                .carry_in(tmp_c_in),
                .z(z[WIDTH - 1 : WIDTH / 2]),
                .carry_out(carry_out)
            );
        end
    endgenerate

    assign carry_out = carry[WIDTH];

endmodule

