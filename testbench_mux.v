// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;

    // input and output test signals
    reg[63:0] y0;
    reg[63:0] y1;
    reg[63:0] y2;
    reg[63:0] y3;

    reg[1:0] x;
    wire[63:0] z;

    // creating the instance of the module we want to test
    //  lab1 - module name
    //  dut  - instance name ('dut' means 'device under test')
    mux64_4_2 dut (.y0(y0), .y1(y1), .y2(y2), .y3(y3), .x(x), .z(z));

    // do at the beginning of the simulation
    initial
        begin
            y0 = 64'd0;
            y1 = 64'd1;
            y2 = 64'd2;
            y3 = 64'd3;

            x = 2'b00;    // set test signals value
            #10;            // pause
            x = 2'b01;    // set test signals value
            #10;            // pause
            x = 2'b10;    // set test signals value
            #10;            // pause
            x = 2'b11;    // set test signals value
            #10;            // pause
        end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial
        $monitor("x=%b z=%b", x, z);

    // do at the beginning of the simulation
    initial
        $dumpvars;  //iverilog dump init

endmodule
