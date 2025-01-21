#set cts_enable_clock_at_hierarchical_pin true
#set power_cg_auto_identify true

check_clock_tree

report_clock
report_clock -skew
report_clock_tree -summary
report_constraint -all

set_fix_hold [all_clocks]

check_physical_design -stage pre_clock_opt

remove_ideal_network -all
clock_opt -fix_hold_all_clocks -no_clock_route  

report_timing > bf_cts_setup.log
report_timing -delay_type min -sign 4 > bf_cts_hold.log

update_clock_latency

report_timing > cts_setup.log
report_timing -delay_type min -sign 4 > cts_hold.log

derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "cts"
