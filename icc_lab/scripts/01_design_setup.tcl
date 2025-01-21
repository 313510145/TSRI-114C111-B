create_mw_lib  -technology ../tech/NangateOpenCellLibrary.tf -mw_reference_library {../physical_lib/NangateOpenCellLibrary ../physical_lib/RF_2P_ADV64_16 ../physical_lib/tpz} -bus_naming_style {[%d]}  -open  CHIP
import_designs -format verilog -top CHIP -cel CHIP {../design_data/CHIP_syn.v}
set_tlu_plus_files -max_tluplus ../tluplus/NangateOpenCellLibrary.tluplus -tech2itf_map  ../tluplus/NangateOpenCellLibrary.map
read_sdc  -version Latest "../design_data/CHIP.sdc"
save_mw_cel  -design "CHIP"
save_mw_cel  -design "CHIP" -as "design_setup"
