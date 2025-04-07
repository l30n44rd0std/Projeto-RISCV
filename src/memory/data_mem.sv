module data_mem(
    input logic clk,
    input logic memWrite,
    input logic memRead,
    input logic [31:0] addr,
    input logic [31:0] wd, //write data
    output logic [31:0] rd //readdata
);
    logic [31:0] dmem[0:31];

    initial begin
        $readmemh("testvectors/data.hex", dmem);  // <-- opcional, pode começar vazio
    end

    always_ff @(posedge clk) begin
        if (memWrite)
            dmem[addr >> 2] <= wd;
    end

    assign rd = dmem[addr >> 2];
endmodule
