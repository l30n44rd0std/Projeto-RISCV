module instruction_memory(
    input logic [31:0] addr,
    output logic [31:0] instr
);
    logic [31:0] imem[0:31];

    initial begin
        $readmemh("testvectors/program.hex", imem);  // <-- Lê o binário das instruções
    end

    assign instr = imem[addr >> 2];  // addr é byte-addressable, por isso >> 2
endmodule
