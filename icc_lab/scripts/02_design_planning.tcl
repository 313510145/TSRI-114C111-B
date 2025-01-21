create_cell {cornerLL cornerLR cornerUL cornerUR} PADCORNER
create_cell {core_vdd1 core_vdd2 core_vdd3 core_vdd4} PADVDD
create_cell {core_vss1 core_vss2 core_vss3 core_vss4} PADVSS
create_cell {io_vdd7} PADIOVDDPOC
create_cell {io_vdd1 io_vdd2 io_vdd3 io_vdd4 io_vdd5 io_vdd6} PADIOVDD
create_cell {io_vss1 io_vss2 io_vss3 io_vss4 io_vss5 io_vss6 io_vss7} PADIOVSS

read_pin_pad_physical_constraints ../design_data/io.tdf
create_floorplan -core_utilization 0.4 -flip_first_row -left_io2core 80 -bottom_io2core 80 -right_io2core 80 -top_io2core 80
insert_pad_filler -cell {PADFILLER20 PADFILLER10 PADFILLER5 PADFILLER1 PADFILLER05 PADFILLER0005} -overlap_cell {PADFILLER0005}

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "die_init"

create_fp_placement

set_keepout_margin  -type hard -all_macros -outer {20.0 20.0 20.0 20.0}

move_objects -x 280 -y 280 [get_cells DCT_tposemem_Bisted_RF_2P_ADV64x16_RF_2P_ADV64x16_u0_SRAM_i0]

set_dont_touch_placement [all_macro_cells]

create_fp_placement -incremental all

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "before_PNS"

derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}

set_fp_rail_constraints -add_layer  -layer metal5 -direction horizontal -max_strap 12 -min_strap 6 -max_width 4 -min_width 4 -spacing minimum
set_fp_rail_constraints -add_layer  -layer metal4 -direction vertical -max_strap 12 -min_strap 6 -max_width 4 -min_width 4 -spacing minimum
set_fp_rail_constraints  -set_ring -nets  {VDD VSS VDD VSS VDD VSS}  -horizontal_ring_layer { metal5 } -vertical_ring_layer { metal4 } -ring_width 8 -ring_offset 3 -extend_strap core_ring
set_fp_rail_constraints -set_global   -no_routing_over_hard_macros
set_fp_block_ring_constraints -add -horizontal_layer metal5 -horizontal_width 1.500 -horizontal_offset 1.000 -vertical_layer metal4 -vertical_width 1.500 -vertical_offset 1.000 -block_type master  -block {  RF_2P_ADV64_16} -net  {VDD VSS}

synthesize_fp_rail  -nets {VDD VSS} -voltage_supply 1.8 -synthesize_power_plan -power_budget 8.5

commit_fp_rail

#create_power_straps  -direction vertical  -start_at 845 -nets  {VSS VDD}  -layer M4 -width 8 -extend_for_multiple_connections  -extension_gap 16

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "before_preroute_instances"

preroute_instances  -ignore_macros -ignore_cover_cells -primary_routing_layer preferred -extend_for_multiple_connections -extension_gap 16
preroute_instances  -ignore_pads -ignore_cover_cells -primary_routing_layer pin
preroute_standard_cells -extend_for_multiple_connections  -extension_gap 16 -connect horizontal  -remove_floating_pieces  -do_not_route_over_macros  -fill_empty_rows  -port_filter_mode off -cell_master_filter_mode off -cell_instance_filter_mode off -voltage_area_filter_mode off -route_type {P/G Std. Cell Pin Conn}

#cut_row -within {{835 483} {940 515}}
#cut_row -within {{835 615} {940 640}}

verify_pg_nets -macro_pin_connection all

set_pnet_options -partial "metal4 metal5"
create_fp_placement  -incremental all

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "design_planning"

