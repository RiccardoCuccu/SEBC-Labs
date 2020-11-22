#!/bin/bash
touch diff_mod.txt

file1="g_block.vhd"
file2="pg_block.vhd"
file3="pg_network_block.vhd"
file4="pg_network.vhd"
file5="carry_select_block.vhd"
file6="carry_logic_network.vhd"
file7="carry_generator.vhd"
file8="sum_generator.vhd"
file9="p4_adder_1.vhd"

file=$file6


cp "./src/P4_1/$file" ./bug.vhd
cp "../vREF/src/P4_1/$file" ./ref.vhd

#diff --suppress-common-lines -y -i bug.vhd ref.vhd > diff_mod.txt
diff -U 0 bug.vhd ref.vhd > diff_mod.txt

rm bug.vhd ref.vhd