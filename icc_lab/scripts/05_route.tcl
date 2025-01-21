report_timing
report_timing -delay_type min -sign 4

#create_route_guide -name route_guide_0 -no_signal_layers {metal1 via1 metal2 via2 metal3 via3 metal4 via4 metal5 via5 metal6 via6 metal7 via7 metal8 via8 metal9 via9 metal10} -coordinate {{280.0000 280.0000} {400.0000 400.0000}} -no_snap

set_route_zrt_common_options  -post_detail_route_redundant_via_insertion high -concurrent_redundant_via_mode insert_at_high_cost -concurrent_redundant_via_effort_level high
#source ../tech/antenna_9lm_CIC.clf  

route_zrt_group -all_clock_nets

route_zrt_auto   

#set_route_zrt_detail_options  -diode_libcell_names ANTENNA_X1 -insert_diodes_during_routing true
verify_zrt_route
route_zrt_detail -incremental true -initial_drc_from_input true
derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}

route_opt

report_timing > route_setup.log
report_timing -delay_type min -sign 4 > route_hold.log

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "route"
