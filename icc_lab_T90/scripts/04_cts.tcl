set cts_enable_clock_at_hierarchical_pin true
set power_cg_auto_identify true

check_clock_tree

report_clock
report_clock -skew
report_clock_tree -summary
report_constraint -all

set_fix_hold [all_clocks]

check_physical_design -stage pre_clock_opt
clock_opt -fix_hold_all_clocks -no_clock_route  



save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "cts"
