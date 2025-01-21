create_mw_lib  -technology /cad/CBDK/CBDK_TSMC90GUTM_Arm_v1.2/CIC/ICC/tsmc090_9lm_2thick_cic.tf -mw_reference_library {../ref_lib/nco_table_cos ../ref_lib/nco_table_log /cad/CBDK/CBDK_TSMC90GUTM_Arm_v1.2/CIC/ICC/tpzn90gv3 /cad/CBDK/CBDK_TSMC90GUTM_Arm_v1.2/CIC/ICC/tpbn90v /cad/CBDK/CBDK_TSMC90GUTM_Arm_v1.2/CIC/ICC/tsmc090nvt_fram /cad/CBDK/CBDK_TSMC90GUTM_Arm_v1.2/CIC/ICC/tsmc090hvt_fram} -bus_naming_style {[%d]}  -open  CHIP
import_designs -format verilog -top CHIP -cel CHIP {../design_data/CHIP_syn.v}
set_tlu_plus_files   -max_tluplus /cad/CBDK/CBDK_TSMC90GUTM_Arm_v1.2/CIC/ICC/tluplus/crn90lp_1p09m+alrdl_mim_typical.tluplus -tech2itf_map  /cad/CBDK/CBDK_TSMC90GUTM_Arm_v1.2/CIC/ICC/tluplus/T90.map
read_sdc  -version Latest "../design_data/CHIP.sdc"
save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "design_setup"
