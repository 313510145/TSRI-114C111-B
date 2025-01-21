create_cell {cornerLL cornerLR cornerUL cornerUR} PCORNERG_33
create_cell {core_vdd1 core_vdd2 core_vdd3 core_vdd4 core_vdd5 core_vdd6} PVDD1DGZ_33
create_cell {core_vss1 core_vss2 core_vss3 core_vss4 core_vss5 core_vss6} PVSS1DGZ_33
create_cell {io_vdd12} PVDD2POC_33
create_cell {io_vdd1 io_vdd2 io_vdd3 io_vdd4 io_vdd5 io_vdd6 io_vdd7 io_vdd8 io_vdd9 io_vdd10 io_vdd11} PVDD2DGZ_33
create_cell {io_vss1 io_vss2 io_vss3 io_vss4 io_vss5 io_vss6 io_vss7 io_vss8 io_vss9 io_vss10 io_vss11 io_vss12} PVSS2DGZ_33

read_pin_pad_physical_constraints ../design_data/io.tdf
create_floorplan -core_utilization 0.6 -flip_first_row -left_io2core 90 -bottom_io2core 90 -right_io2core 90 -top_io2core 90
insert_pad_filler -cell {PFILLER20G_33 PFILLER10G_33 PFILLER5G_33 PFILLER1G_33 PFILLER05G_33 PFILLER0005G_33} -overlap_cell {PFILLER0005G_33}

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "die_init"

create_fp_placement

set_keepout_margin  -type hard -all_macros -outer {20.0 20.0 20.0 20.0}

move_objects -x 280 -y 446 [get_cells -hier log]
move_objects -x 280 -y 280 [get_cells -hier cos]

set_dont_touch_placement [all_macro_cells]

create_fp_placement -incremental all
derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}

set_fp_rail_constraints -add_layer  -layer M5 -direction horizontal -max_strap 10 -min_strap 3 -max_width 8 -min_width 8
set_fp_rail_constraints -add_layer  -layer M4 -direction vertical -max_strap 10 -min_strap 3 -max_width 8 -min_width 8
set_fp_block_ring_constraints -add -horizontal_layer M5 -horizontal_width 8 -horizontal_offset 1.5 -vertical_layer M4 -vertical_width 8 -vertical_offset 1.5 -block_type master  -block {  nco_table_cos nco_table_log} -net  {VDD VSS}
set_fp_rail_constraints -set_global   -no_routing_over_hard_macros
set_fp_rail_constraints  -set_ring -nets  {VDD VSS VDD VSS VDD VSS}  -horizontal_ring_layer { M5 } -vertical_ring_layer { M4 } -ring_width 8 -ring_offset 3 -extend_strap core_ring
synthesize_fp_rail  -nets {VDD VSS} -voltage_supply 1 -synthesize_power_plan -power_budget 80

commit_fp_rail

create_power_straps  -direction vertical  -start_at 845 -nets  {VSS VDD}  -layer M4 -width 8 -extend_for_multiple_connections  -extension_gap 16
preroute_instances  -ignore_macros -ignore_cover_cells -primary_routing_layer pin -extend_for_multiple_connections -extension_gap 16

preroute_instances  -ignore_pads -ignore_cover_cells -primary_routing_layer pin

cut_row -within {{835 483} {940 515}}
cut_row -within {{835 615} {940 640}}
preroute_standard_cells -extend_for_multiple_connections  -extension_gap 16 -connect horizontal  -remove_floating_pieces  -do_not_route_over_macros  -fill_empty_rows  -port_filter_mode off -cell_master_filter_mode off -cell_instance_filter_mode off -voltage_area_filter_mode off -route_type {P/G Std. Cell Pin Conn}
set_pnet_options -partial "M4 M5"
create_fp_placement  -incremental all

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "design_planning"

