`timescale 1ns / 1ps

module tb_sram();

    reg i_clk = 0;
    reg i_ce;
    // reg i_we;
    reg i_rw;
    reg [5:0] i_addr; // 6bit = 64 
    reg [7:0] i_data;
    // wire [7:0] o_data;
    wire [7:0] io_data;
/*
    single_ram DUT(
    .i_clk(i_clk),
    .i_ce(i_ce),
    .i_we(i_we),
    .i_addr(i_addr), // 6bit = 64 
    .i_data(i_data),
    .o_data(o_data)
    );
*/

    static_ram DUT(
    .i_clk(i_clk),
    .i_ce(i_ce),
    .i_rw(i_rw),
    .i_addr(i_addr), // 6bit = 64 
    .i_data(i_data),
    .io_data(io_data)
    );

    always #5 i_clk = ~i_clk;

    initial begin
        i_clk = 0;
        i_ce = 0;
        i_rw = 0;
        i_addr = 0;
        i_data = 0;
        io_data = 8'bzzzzzzzz;
        
        #20 i_ce = 1; i_rw = 1;
        for (integer i=0; i<64; i=i+1) begin
            #20 i_addr = i; io_data = i+1;
        end

        #20 i_rw = 0;
        for (integer i=0; i<64; i=i+1) begin
            #20 i_addr = i;
        end

        #20 $finish;
    end

endmodule
