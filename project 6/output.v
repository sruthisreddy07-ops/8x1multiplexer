iverilog -o mux_sim MUX_8_to_1.v MUX_8_to_1_tb.v
vvp mux_sim
gtkwave waveform.vcd
