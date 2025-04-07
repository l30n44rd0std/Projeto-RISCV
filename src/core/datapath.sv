module datapath(
    input logic clk,
    input logic reset,
    output logic [31:0] pc,
    output logic [31:0] instr
);
    logic regWrite, aluSrc, memRead, memWrite;
    logic [2:0] aluControl;
    logic [31:0] imm, rd1, rd2, aluB, aluResult, memOut;

    assign pc = pc_reg;
    logic [31:0] pc_reg = 0;

    instruction_memory im(.addr(pc_reg), .instr(instr));
    immediate_generator ig(.instr(instr), .imm(imm));
    control_unit cu(.opcode(instr[6:0]), .*); 
    regfile rf(.clk, .we(regWrite), .rs1(instr[19:15]), .rs2(instr[24:20]),
               .rd(instr[11:7]), .wd(memRead ? memOut : aluResult), .rd1, .rd2);
    alu myalu(.a(rd1), .b(aluSrc ? imm : rd2), .aluControl, .result(aluResult));
    data_mem dm(.clk, .memWrite, .memRead, .addr(aluResult), .wd(rd2), .rd(memOut));

    always_ff @(posedge clk) begin
        pc_reg <= pc_reg + 4;
    end
endmodule