module top(
    input logic clk,
    input logic reset,
    output logic [31:0] pc,
    output logic [31:0] instr,
    output logic [31:0] cycle
);
    logic [31:0] internal_cycle;

    // Ciclo de clock (contador de ciclos)
    always_ff @(posedge clk) begin
        if (reset)
            internal_cycle <= 0;
        else
            internal_cycle <= internal_cycle + 1;
    end

    assign cycle = internal_cycle;

    // Instância do datapath com pc e instr como saídas
    datapath dp (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instr(instr)
    );
endmodule
