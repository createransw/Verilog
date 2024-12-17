module register_file #(parameter WIDTH = 8, ADDRESS_WIDTH = 8)(
    input clock, we,
    input [ADDRESS_WIDTH-1:0] a0, a1, a2,
    input [WIDTH-1:0] wd,
    output [WIDTH-1:0] rd0, rd1
);
    reg [WIDTH - 1 : 0] data[2**ADDRESS_WIDTH - 1 : 0];

    initial data[0] = 0;

    always @(posedge clock)
        if (we && (a2 != 0))
            data[a2] <=  wd;

    assign rd0 = data[a0];
    assign rd1 = data[a1];


endmodule

