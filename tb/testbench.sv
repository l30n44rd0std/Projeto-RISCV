module testbench;
    logic clk, reset;
    logic [31:0] pc, instr, cycle;

    // Instância do top
    top uut (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instr(instr),
        .cycle(cycle)
    );

    // Geração de clock
    always #5 clk = ~clk; // 10ns por ciclo

    initial begin
        // Inicialização
        clk = 0;
        reset = 1;

        // 🔽 Dump de ondas
        $dumpfile("waveforms/waves.vcd"); // arquivo será salvo na pasta waveforms/
        $dumpvars(0, testbench);          // dump do escopo inteiro a partir de testbench

        // Reset por alguns ciclos
        #20;
        reset = 0;

        // Simulação por alguns ciclos
        repeat (10) begin
            @(posedge clk);
            $display("Cycle = %0d | PC = %0d | instr = %h", cycle, pc, instr);
        end

        $display("Fim da simulação.");
        $finish;
    end
endmodule
