module immediate_generator(
    input logic [31:0] instr,
    output logic [31:0] imm
);
    logic [6:0] opcode;

always @(*) begin
    case (instr[6:0])
        7'b0010011, 7'b0000011: // I-type
            imm = {{20{instr[31]}}, instr[31:20]};
        7'b0100011: // S-type
            imm = {{20{instr[31]}}, instr[31:25], instr[11:7]};
        default:
            imm = 32'd0;
    endcase
end

endmodule
