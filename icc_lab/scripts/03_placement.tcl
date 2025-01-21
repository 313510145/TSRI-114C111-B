read_sdc  -version Latest "../design_data/CHIP.sdc"
report_clock
report_clock -skew
set_zero_interconnect_delay_mode true
report_timing
report_constraint -all

set_zero_interconnect_delay_mode false


check_physical_constraints

read_def ../design_data/CHIP.scandef
report_scan_chain
check_scan_chain

report_power
#source ../scripts/group_MVT.tcl


#read_saif -input ../design_data/CHIP.saif -instance_name  test_top/CHIP_1

source ../scripts/add_tie.tcl

check_physical_design -stage pre_place_opt
place_opt -optimize_dft -power 
report_power
#source ../scripts/group_MVT.tcl
derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}

report_timing > place_setup.log
report_timing -delay_type min -sign 4 > place_hold.log

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "placement"
