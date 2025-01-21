source ../scripts/addCoreFiller.cmd
#insert_metal_filler  -out self

verify_zrt_route
route_zrt_detail -incremental true -initial_drc_from_input true

derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}

report_timing > final_setup.log
report_timing -delay_type min -sign 4 > final_hold.log
report_power > final_power.log

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "before_add_io_text"

source ../scripts/add_io_text.tcl
add_io_text metal7 5 portName

create_text -origin {570 640} -layer metal5 -height 5 VDD
create_text -origin {570 630} -layer metal5 -height 5 VSS
create_text -origin {749 563} -layer metal7 -height 5 IOVDD
create_text -origin {749 494} -layer metal7 -height 5 IOVSS

source ../scripts/createNplace_bondpads.tcl
createNplace_bondpads 	-inline_pad_ref_name BONDINNER -stagger true -stagger_pad_ref_name BONDOUTER

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "dfm"


