#!/bin/bash
touch diff_mod.txt
#file="sum_generator.vhd"
file="carry_select_block.vhd"


cp "./src/P4_2/$file" ./bug.vhd
cp "../vREF/src/P4_2/$file" ./ref.vhd
#sed /ˆ$/d bug.vhd
#sed /ˆ$/d ref.vhd

#diff --suppress-common-lines -y -i bug.vhd ref.vhd > diff_mod.txt
diff -U 0 bug.vhd ref.vhd > diff_mod.txt

rm bug.vhd ref.vhd