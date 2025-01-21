write_verilog -unconnected_ports -diode_ports -wire_declaration -keep_backslash_before_hiersep -no_physical_only_cells CHIP_pr.v
write_sdf -version 1.0 -context verilog -load_delay net CHIP_pr.sdf
