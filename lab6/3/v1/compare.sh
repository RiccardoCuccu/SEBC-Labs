#!/bin/bash
#touch diff_mod.txt

file="counter.vhd"

cp "./$file" ./bug.vhd
cp "../vREF/$file" ./ref.vhd

#diff --suppress-common-lines -y -i bug.vhd ref.vhd > diff_mod.txt
diff -U 0 bug.vhd ref.vhd #> diff_mod.txt

rm bug.vhd ref.vhd