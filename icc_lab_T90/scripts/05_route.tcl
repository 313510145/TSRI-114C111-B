report_timing
derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}

source /cad/CBDK/CBDK_TSMC90GUTM_Arm_v1.2/CIC/ICC/antenna_9lm_CIC.clf  
set_route_zrt_common_options  -post_detail_route_redundant_via_insertion high -concurrent_redundant_via_mode insert_at_high_cost -concurrent_redundant_via_effort_level high

route_zrt_group -all_clock_nets

route_zrt_auto   

set_route_zrt_detail_options  -diode_libcell_names ANTENNA -insert_diodes_during_routing true
verify_zrt_route
route_zrt_detail -incremental true -initial_drc_from_input true
derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}
save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "route"
