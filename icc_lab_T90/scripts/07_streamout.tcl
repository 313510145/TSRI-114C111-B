set_write_stream_options -map_layer /cad/CBDK/CBDK_TSMC90GUTM_Arm_v1.2/CIC/ICC/macro.map  -child_depth 20 -flatten_via
write_stream -format gds -lib_name CHIP -cells {CHIP } CHIP.gds
