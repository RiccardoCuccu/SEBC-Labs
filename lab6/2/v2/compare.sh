#!/bin/bash
touch diff_mod.txt

#file="g_block.vhd"
#file="pg_block.vhd"
#file="pg_network_block.vhd"
#file="pg_network.vhd"
#file="carry_select_block.vhd"
#file="carry_logic_network.vhd"
#file="carry_generator.vhd"
file="sum_generator.vhd"
#file="p4_adder_2.vhd"


cp "./src/P4_2/$file" ./bug.vhd
cp "../vREF/src/P4_2/$file" ./ref.vhd

#diff --suppress-common-lines -y -i bug.vhd ref.vhd > diff_mod.txt
diff -U 0 bug.vhd ref.vhd > diff_mod.txt

rm bug.vhd ref.vhd