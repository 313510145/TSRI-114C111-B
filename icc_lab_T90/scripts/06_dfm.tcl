source ../scripts/addCoreFiller_MVT.cmd
verify_zrt_route
route_zrt_detail -incremental true -initial_drc_from_input true

derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}

source ../scripts/add_io_text.tcl
add_io_text TEXT3 5 portName

create_text -layer TEXT5 -height 5 -origin {651 933} VDD
create_text -layer TEXT5 -height 5 -origin {651 923} VSS
create_text -layer TEXT3 -height 5 -origin {1046 924} IOVDD
create_text -layer TEXT3 -height 5 -origin {1046 839} IOVSS

source ../bond_pads/createNplace_bondpads.tcl
createNplace_bondpads 	-inline_pad_ref_name PAD60GU -stagger true -stagger_pad_ref_name PAD60NU 

save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "dfm"


