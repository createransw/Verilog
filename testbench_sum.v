// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;

    // input and output test signals
    reg[8:0] x;
    reg[8:0] y;
    reg carry_in;

    wire[8:0] z;
    wire carry_out;
    // creating the instance of the module we want to test
    //  lab1 - module name
    //  dut  - instance name ('dut' means 'device under test')
    carry_lookahead_adder dut (.x(x), .y(y), .carry_in(carry_in), .z(z), .carry_out(carry_out));

    // do at the beginning of the simulation
    initial
        begin
            carry_in = 0;
            x = 8'b11;
            y = 8'b101;

            #10;            // pause
            x = 8'b0;    // set test signals value
            #10;            // pause
            carry_in = 1;
            #10;            // pause
            x = 8'b11000000;
            y = 8'b01000000;
            #10;
        end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial
        $monitor("x=%b y=%b carry_in=%b z=%b carry_out=%b", x, y,carry_in, z, carry_out);

    // do at the beginning of the simulation
    initial
        $dumpvars;  //iverilog dump init

endmodule
