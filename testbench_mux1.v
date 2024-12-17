// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;

    // input and output test signals
    reg[7:0] y0;
    reg[7:0] y1;
    reg[7:0] y2;
    reg[7:0] y3;

    reg[1:0] x;
    wire[7:0] z;

    // creating the instance of the module we want to test
    //  lab1 - module name
    //  dut  - instance name ('dut' means 'device under test')
    mux dut (.data_in({y0, y1, y2, y3}), .address(x), .data_out(z));

    // do at the beginning of the simulation
    initial
        begin
            y0 = 8'd0;
            y1 = 8'd1;
            y2 = 8'd2;
            y3 = 8'd3;

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
