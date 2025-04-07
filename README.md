# 🔧 RISC-V Monocycle Processor – SystemVerilog

Este projeto implementa um processador RISC-V monociclo utilizando **SystemVerilog**, simulando instruções básicas da arquitetura RISC-V (como `add`, `lw`, `sw`, `jal`, `beq`, etc).

---

## 📁 Estrutura do Projeto

```bash
.
├── src/                    # Código-fonte do processador
│   ├── top.sv
│   ├── core/
│   │   ├── datapath.sv
│   │   ├── control_unit.sv
│   │   ├── alu.sv
│   │   ├── regfile.sv
│   │   └── immediate_generator.sv
│   └── memory/
│       ├── instruction_memory.sv
│       └── data_mem.sv
├── tb/
│   └── testbench.sv        # Testbench principal
├── testvectors/
│   ├── program.hex         # Programa de teste (instruções em hexadecimal)
│   └── data.hex            # Dados iniciais da memória (opcional)
├── waveforms/
│   └── waves.vcd           # Arquivo de ondas gerado pela simulação
├── sim/
│   └── sim.out             # Binário da simulação gerado pelo Icarus Verilog
└── README.md
```

## 🛠️ Instalação dos pré-requisitos

Certifique-se de ter o seguinte instalado:
🔹 Icarus Verilog
	```sudo apt update```
	```sudo apt install iverilog```
🔹 GTKWave
	```sudo apt install gtkwave```
Ou ```sudo dnf install iverilog gtkwave``` (no Fedora)

## 🚀 Compilação e Simulação

1. Compilar
```bash
iverilog -g2012 -o sim/sim.out \
  tb/testbench.sv \
  src/top.sv \
  src/core/datapath.sv \
  src/core/control_unit.sv \
  src/core/alu.sv \
  src/core/regfile.sv \
  src/memory/instruction_memory.sv \
  src/core/immediate_generator.sv \
  src/memory/data_mem.sv
```

2. Executar a simulação
```vvp sim/sim.out```

Esse comando executa o binário gerado e, se configurado corretamente, irá:
- Exibir informações como Cycle, PC, e instr.
- Gerar o arquivo de onda waveforms/waves.vcd.

3. Visualizar ondas com GTKWave
```gtkwave waveforms/waves.vcd```

Nessa interface gráfica, você pode explorar sinais do processador, como registradores, barramentos, memória, ALU, etc.

## 🧪 Sobre os Arquivos .hex

    program.hex: contém as instruções do programa de teste, geralmente convertidas a partir de um .s (assembly).

    data.hex: dados iniciais opcionais para a memória de dados (pode estar vazio ou conter palavras de 32 bits em hex).

Exemplo de program.hex:

00500113
00C00193
FF718393
...

## 📚 Créditos e Referências:

- Baseado no projeto educacional de Sarah Harris e David Harris – Digital Design and Computer Architecture: RISC-V Edition.
- Simulações com Icarus Verilog e GTKWave.

## 📌 Dicas

- Modifique o testbench.sv para diferentes programas de teste.
- Explore o GTKWave adicionando sinais como pc, instr, regfile, alu_out, etc.
- Utilize $dumpvars(0, dut) para observar sinais internos.

Feito com 💻 por Leonardo José e Gustavo Mendonça.