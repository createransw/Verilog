module register_file #(parameter WIDTH = 4, ADDRESS_WIDTH = 2)(
  input clock, we,
  input [ADDRESS_WIDTH-1:0] a0, a1, a2,
  input [WIDTH-1:0] wd,
  output [WIDTH-1:0] rd0, rd1
);
  
  reg [WIDTH-1:0] rf[WIDTH-1:0];

  always @(posedge clock)
    if (we) rf[a2] <= wd;
  assign rd0 = (a0 != 0) ? rf[a0] : 0;
  assign rd1 = (a1 != 0) ? rf[a1] : 0;
endmodule