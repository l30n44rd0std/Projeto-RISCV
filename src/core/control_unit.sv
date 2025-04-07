module control_unit(
    input logic [6:0] opcode,
    output logic regWrite,
    output logic aluSrc,
    output logic memRead,
    output logic memWrite,
    output logic [2:0] aluControl
);
    always_comb begin
        regWrite = 0;
        aluSrc = 0;
        memRead = 0;
        memWrite = 0;
        aluControl = 3'b000;

        case (opcode)
            7'b0110011: begin // R-type
                regWrite = 1;
                aluControl = 3'b000;
            end
            7'b0010011: begin // I-type (addi)
                regWrite = 1;
                aluSrc = 1;
                aluControl = 3'b000;
            end
            7'b0000011: begin // LW
                regWrite = 1;
                aluSrc = 1;
                memRead = 1;
                aluControl = 3'b000;
            end
            7'b0100011: begin // SW
                aluSrc = 1;
                memWrite = 1;
                aluControl = 3'b000;
            end
        endcase
    end
endmodule