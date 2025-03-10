###################################################################

# Created by write_sdc on Tue Jan 11 10:16:27 2011

###################################################################
set sdc_version 1.8

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max slow -max_library slow.db:slow\
                         -min fast_leakage -min_library fast_leakage
set_load -pin_load 25 [get_ports {error_codeword[9]}]
set_load -pin_load 25 [get_ports {error_codeword[8]}]
set_load -pin_load 25 [get_ports {error_codeword[7]}]
set_load -pin_load 25 [get_ports {error_codeword[6]}]
set_load -pin_load 25 [get_ports {error_codeword[5]}]
set_load -pin_load 25 [get_ports {error_codeword[4]}]
set_load -pin_load 25 [get_ports {error_codeword[3]}]
set_load -pin_load 25 [get_ports {error_codeword[2]}]
set_load -pin_load 25 [get_ports {error_codeword[1]}]
set_load -pin_load 25 [get_ports {error_codeword[0]}]
set_load -pin_load 25 [get_ports {error[9]}]
set_load -pin_load 25 [get_ports {error[8]}]
set_load -pin_load 25 [get_ports {error[7]}]
set_load -pin_load 25 [get_ports {error[6]}]
set_load -pin_load 25 [get_ports {error[5]}]
set_load -pin_load 25 [get_ports {error[4]}]
set_load -pin_load 25 [get_ports {error[3]}]
set_load -pin_load 25 [get_ports {error[2]}]
set_load -pin_load 25 [get_ports {error[1]}]
set_load -pin_load 25 [get_ports {error[0]}]
set_load -pin_load 25 [get_ports hd_end]
set_load -pin_load 25 [get_ports in_clk]
set_load -pin_load 25 [get_ports iteration_start]
set_load -pin_load 25 [get_ports iteration_end]
set_load -pin_load 25 [get_ports out_hd]
set_load -pin_load 25 [get_ports so]
create_clock [get_ports ex_clk]  -period 5  -waveform {0 2.5}
set_clock_latency 0.2  [get_clocks ex_clk]
set_clock_uncertainty -setup 0.1  [get_clocks ex_clk]
create_generated_clock [get_pins full_ldpc_decoder_1/mux_top_1/U2/Y]  -name in_clk  -source [get_ports ex_clk]  -divide_by 4
create_generated_clock [get_pins full_ldpc_decoder_1/TLATNTSCAX6_1/ECK]  -name int_clk  -source [get_ports ex_clk]  -multiply_by 1
set_multicycle_path 4 -setup -start -from [get_clocks ex_clk] -to [get_clocks  \
in_clk]
set_multicycle_path 3 -hold -from [get_clocks ex_clk] -to [get_clocks in_clk]
set_false_path   -from [get_clocks ex_clk]  -to [get_clocks in_clk]
set_false_path   -from [get_ports se]
set_input_delay -clock ex_clk  0.5  [get_ports {db[2]}]
set_input_delay -clock ex_clk  0.5  [get_ports {db[1]}]
set_input_delay -clock ex_clk  0.5  [get_ports {db[0]}]
set_input_delay -clock ex_clk  0.5  [get_ports codeword]
set_input_delay -clock ex_clk  0.5  [get_ports {sel[1]}]
set_input_delay -clock ex_clk  0.5  [get_ports {sel[0]}]
set_input_delay -clock ex_clk  0.5  [get_ports rst]
set_input_delay -clock ex_clk  0.5  [get_ports reset_lfsr]
set_input_delay -clock ex_clk  0.5  [get_ports TM]
set_input_delay -clock ex_clk  0.5  [get_ports si]
set_input_delay -clock ex_clk  0.5  [get_ports se]
set_input_delay -clock ex_clk  0.5  [get_ports data_sel]
set_input_delay -clock ex_clk  0.5  [get_ports {data_in[4]}]
set_input_delay -clock ex_clk  0.5  [get_ports {data_in[3]}]
set_input_delay -clock ex_clk  0.5  [get_ports {data_in[2]}]
set_input_delay -clock ex_clk  0.5  [get_ports {data_in[1]}]
set_input_delay -clock ex_clk  0.5  [get_ports {data_in[0]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[9]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[8]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[7]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[6]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[5]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[4]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[3]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[2]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[1]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error_codeword[0]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[9]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[8]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[7]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[6]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[5]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[4]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[3]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[2]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[1]}]
set_output_delay -clock ex_clk  0.5  [get_ports {error[0]}]
set_output_delay -clock ex_clk  0.5  [get_ports hd_end]
set_output_delay -clock ex_clk  0.5  [get_ports in_clk]
set_output_delay -clock ex_clk  0.5  [get_ports iteration_start]
set_output_delay -clock ex_clk  0.5  [get_ports iteration_end]
set_output_delay -clock ex_clk  0.5  [get_ports out_hd]
set_output_delay -clock ex_clk  0.5  [get_ports so]
