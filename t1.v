module mux64_4_2(
    input wire [63:0] y0, y1, y2, y3,
    input wire [1:0] x,
    output wire [63:0] z
);

assign z = (x == 2'b00) ? y0 :
        ((x == 2'b01) ? y1 :
          ((x == 2'b10) ? y2 : y3));

endmodule
