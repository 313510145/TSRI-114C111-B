
set sdc_version 2.0

create_clock [get_ports {CLK}] -name CLK -period 30 -waveform {0 15} 

set_clock_latency 1 [get_clocks {CLK}]
set_clock_uncertainty  0.1  [get_clocks {CLK}]

set_ideal_network [get_ports {CLK}]

set_false_path   -from [get_ports SCAN_EN]

#set_input_delay     2 [remove_from_collection [all_inputs] [get_ports CLK]]
set_input_delay -clock CLK 1  [get_ports {X[0]}]
set_input_delay -clock CLK 1  [get_ports {X[1]}]
set_input_delay -clock CLK 1  [get_ports {X[2]}]
set_input_delay -clock CLK 1  [get_ports {X[3]}]
set_input_delay -clock CLK 1  [get_ports {X[4]}]
set_input_delay -clock CLK 1  [get_ports {X[5]}]
set_input_delay -clock CLK 1  [get_ports {X[6]}]
set_input_delay -clock CLK 1  [get_ports {X[7]}]
set_input_delay -clock CLK 1  [get_ports {X[8]}]
set_input_delay -clock CLK 1  [get_ports {X[9]}]
set_input_delay -clock CLK 1  [get_ports {X[10]}]
set_input_delay -clock CLK 1  [get_ports {X[11]}]
set_input_delay -clock CLK 1  [get_ports HALT]
set_input_delay -clock CLK 1  [get_ports RESET_]
set_input_delay -clock CLK 1  [get_ports DoDCT]
set_input_delay -clock CLK 1  [get_ports Mode]
set_input_delay -clock CLK 1  [get_ports SCAN_EN]

set_output_delay    1 -clock CLK [all_outputs]

set_drive 0.1 [all_inputs]
set_load -pin_load 20 [all_outputs]


