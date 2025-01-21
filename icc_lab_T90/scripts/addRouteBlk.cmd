#################################################################################
#################################################################################



set LL [get_attribute cornerLL bbox]
set LR [get_attribute cornerLR bbox]
set UR [get_attribute cornerUR bbox]
set UL [get_attribute cornerUL bbox]

set x1 [lindex [lindex $LL 0] 0]
set y1 [lindex [lindex $LL 0] 1]

set x2 [lindex [lindex $LR 0] 0]
set y2 [lindex [lindex $LR 0] 1]

set x3 [lindex [lindex $LR 1] 0]
set y3 [lindex [lindex $LR 1] 1]

set x4 [lindex [lindex $UL 0] 0]
set y4 [lindex [lindex $UL 0] 1]

set x5 [lindex [lindex $UL 1] 0]
set y5 [lindex [lindex $UL 1] 1]

set x6 [lindex [lindex $UR 1] 0]
set y6 [lindex [lindex $UR 1] 1]

create_route_guide -name route_guide_0 -no_signal_layers {METAL5} -coordinate [list $x1 $y1 $x3 $y3] -repair_as_single_sbox -no_snap

create_route_guide -name route_guide_1 -no_signal_layers {METAL5} -coordinate [list $x1 $y1 $x5 $y5] -repair_as_single_sbox -no_snap

create_route_guide -name route_guide_2 -no_signal_layers {METAL5} -coordinate [list $x2 $y2 $x6 $y6] -repair_as_single_sbox -no_snap

create_route_guide -name route_guide_3 -no_signal_layers {METAL5} -coordinate [list $x4 $y4 $x6 $y6] -repair_as_single_sbox -no_snap
