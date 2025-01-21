 foreach_in i [get_flat_cells -all *TIE*] {
 if {[string match [get_object_name [get_nets -all -of [get_pins -all [get_object_name $i]/VDD]]] VDD] != 1} {
   lappend tieh_cells [ get_object_name $i]
}
 if {[string match [get_object_name [get_nets -all -of [get_pins -all [get_object_name $i]/VSS]]] VSS] != 1} {
   lappend tiel_cells [ get_object_name $i]
}
}

derive_pg_connection -power_net VDD -power_pin VDD -cells $tieh_cells
derive_pg_connection -ground_net VSS -ground_pin VSS -cells $tiel_cells

