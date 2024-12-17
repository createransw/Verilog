// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;

    // input and output test signals
    reg j, k, clock;

    wire q, q_bar;

    // creating the instance of the module we want to test
    //  lab1 - module name
    //  dut  - instance name ('dut' means 'device under test')
    jk_trigger dut (.clock(clock), .j(j), .k(k), .q(q), .q_bar(q_bar));
    // do at the beginning of the simulation
    initial
        begin
            j = 0;
            k = 0;
            clock = 0;
            #1;
            clock = 1;
            #1;
            j = 1;
            k = 0;
            clock = 0;
            #1;
            clock = 1;
            #1;
            j = 1;
            k = 1;
            clock = 0;
            #1;
            clock = 1;
            #1;
            clock = 0;
            #1;
            clock = 1;
            #1;
            j = 0;
            k = 0;
            clock = 0;
            #1;
            clock = 1;
            #1;
            j = 0;
            k = 1;
            clock = 0;
            #1;
            clock = 1;
            #1;
            j = 1;
            k = 1;
            clock = 0;
            #1;
            clock = 1;
            #1;
            clock = 0;
            #1;
            clock = 1;
            #1;
            clock = 0;
            #1;
            clock = 1;
            #1;
        end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial
        $monitor("q=%b q_bar=%b", q, q_bar);

    // do at the beginning of the simulation
    initial
        $dumpvars;  //iverilog dump init

endmodule
