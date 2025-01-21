#! /bin/sh
Rv2lvs -v CHIP_pr.v -l tpzn90gv3_lvs.v -l tsmc090nvt_fram_lvs.v -l tsmc090hvt_fram_lvs.v -l nco_table_cos.v -l nco_table_log.v -s tpzn90gv3_lvs.spi -s tsmc090nvt_fram_lvs.spi -s tsmc090hvt_fram_lvs.spi -s nco_table_cos.spi -s nco_table_log.spi -o source.spi -s1 VDD -s0 VSS
