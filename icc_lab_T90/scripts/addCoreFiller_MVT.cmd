#################################################################################
#Close your design (ex: CHIP.CEL) and Reload it Before you use this script file #
#################################################################################
set vtType0Fillers "FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1"
set vtType1Fillers "FILL64TH FILL32TH FILL16TH FILL8TH FILL4TH FILL2TH FILL1TH"
set_cell_vt_type -library ../ref_lib/tsmc090g/ -vt_type "vtType0"
set_cell_vt_type -library ../ref_lib/tsmc090gthvt/ -vt_type "vtType1"
set_vt_filler_rule -threshold_voltage "vtType0 vtType0" -lib_cell $vtType0Fillers
set_vt_filler_rule -threshold_voltage "vtType0 vtType1" -lib_cell $vtType0Fillers
set_vt_filler_rule -threshold_voltage "vtType1 vtType0" -lib_cell $vtType0Fillers
set_vt_filler_rule -threshold_voltage "vtType1 vtType1" -lib_cell $vtType1Fillers
set_vt_filler_rule -threshold_voltage "vtType0" -lib_cell $vtType0Fillers
set_vt_filler_rule -threshold_voltage "vtType1" -lib_cell $vtType1Fillers
insert_stdcell_filler  -connect_to_power {VDD}  -connect_to_ground {VSS}

insert_stdcell_filler  -cell_without_metal $vtType0Fillers -connect_to_power {VDD} -connect_to_ground {VSS}

