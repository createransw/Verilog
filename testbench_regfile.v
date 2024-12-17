// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;

    // input and output test signals
    reg clock, we;
    reg[7:0] a0, a1, a2, wd;
    wire[7:0] rd0, rd1;

    // creating the instance of the module we want to test
    //  lab1 - module name
    //  dut  - instance name ('dut' means 'device under test')
    register_file dut (.clock(clock), .we(we), .a0(a0), .a1(a1), .a2(a2), .wd(wd), .rd0(rd0), .rd1(rd1));

    // do at the beginning of the simulation
    initial
        begin
            a0 = 0;
            a1 = 30;

            we = 0;
            wd = 7;

            a2 = 2;

            clock = 0;
            #1
            clock = 1;
            #1;
            clock = 0;
            #1
            clock = 1;
            #1;
            we = 1;
            clock = 0;
            #1
            clock = 1;
            #1;
            we = 0;
            wd = 5;
            clock = 0;
            #1
            clock = 1;
            #1;
            a0 = 2;
            a2 = 30;
            we = 1;
            clock = 0;
            #1
            clock = 1;
            #1;

        end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial
        $monitor("rd0=%b rd1=%b", rd0, rd1);

    // do at the beginning of the simulation
    initial
        $dumpvars;  //iverilog dump init

endmodule
