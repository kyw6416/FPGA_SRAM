`timescale 1ns / 1ps

module static_ram(
    input i_clk,
    input i_ce,
    input i_rw,
    input [5:0] i_addr, // 6bit = 64 
    input [7:0] i_data,
    //output [7:0] io_data
    inout [7:0] io_data
    );

    reg [7:0] mem[0:63];
    reg [5:0] r_addr;
    //assign o_data = mem[r_addr];
    assign io_data = (i_rw == 1) ? mem[r_addr] : 8'bzzzzzzzz;    // high-임피던스(무한대의 저항) 상태에서 ram이 값을 읽음(read)

    always @(posedge i_clk) begin
        if (i_ce) begin
            if(i_rw) begin
                mem[i_addr] <= io_data;
            end
            else begin
                r_addr <= i_addr; 
            end
        end
        else begin
        end
    end
endmodule
