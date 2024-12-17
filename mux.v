module mux #(parameter DATA_WIDTH = 8, parameter ADDRESS_WIDTH = 2) (data_in, address, data_out);

    input wire[DATA_WIDTH * (2**ADDRESS_WIDTH) - 1 : 0] data_in;
    input wire[ADDRESS_WIDTH - 1 : 0] address;

    output wire[DATA_WIDTH - 1 : 0] data_out;

    wire[DATA_WIDTH - 1 : 0] tmp[2**ADDRESS_WIDTH - 1 : 0];

    genvar i;
    generate
        for (i = 0; i < 2**ADDRESS_WIDTH; i = i + 1)
        begin: stage
            assign tmp[i] = data_in[DATA_WIDTH * (i + 1) - 1 : DATA_WIDTH * i];
        end
    endgenerate

    assign data_out = tmp[address];

endmodule

