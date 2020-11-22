#!/bin/bash

entity_substitution() {     #$1=$file_in, #2=a|b
  n=`grep -i "^ENTITY " $1 | cut -d " " -f 2`
  if [[ ! -z "$n" ]]; then    # if not empty
    echo "- Entity: $n"
    sed -i "s/ $n / $n\_$2 /g" $1
    sed -i "s/ $n;/ $n\_$2;/g" $1
  fi
}

#architecture_substitution() {     #$1=$file_in, #2=a|b
  #o=`grep -i "^ARCHITECTURE " $1 | cut -d " " -f 4`
  #echo "architecture = $o"
  #sed -i "s/ $o / $o\_$2 /g" $1
#}

component_substitution() {  #$1=$file_in, #2=a|b|bug
  while read line; do
    #if [[ ${line^^} =~ "COMPONENT" ]]; then
		  if [[ ${line^^} =~ "END COMPONENT" ]]; then
		  	p=`echo $line | cut -d " " -f 3 | cut -d ";" -f 1`
	   		#echo "-- Line: $line"
        #echo "-- Component: $p"
        #echo " "
        sed -i "s/ $p;/ $p\_$2;/g" $1
  		elif [[ ${line^^} =~ "COMPONENT " ]]; then
  			p=`echo $line | cut -d " " -f 2`
  			#echo "-- Line: $line"
  			#echo "-- Component: $p"
  			#echo " "
        sed -i "s/COMPONENT $p/COMPONENT $p\_$2/g" $1
        sed -i "s/: $p/: $p\_$2/g" $1
        sed -i "s/ $p / $p\_$2 /g" $1
      fi
    #fi
  done < $1
}

rm -r src
version=$(pwd | cut -d "/" -f 7)
echo "Version: $version"
cp -r /home/repository/lowpower/ese6/2/"$version"/src .

cd src
cp -r utils utils_2
mv utils utils_1

for file_out in $(ls); do
	if [[ -d $file_out ]]; then
		cd $file_out
		echo "Folder: $file_out"
		for file_in in $(ls); do
			if [[ -f $file_in ]]; then
        		location=$(pwd)
        		if [[ $location =~ "P4_1" ]]; then 
          			entity_substitution "$file_in" "a"
          			component_substitution "$file_in" "a"
        		elif [[ $location =~ "P4_2" ]]; then
          			entity_substitution "$file_in" "b"
          			component_substitution "$file_in" "b"
        		elif [[ $location =~ "utils_1" ]]; then
          			entity_substitution "$file_in" "a"
          			component_substitution "$file_in" "a"
          		elif [[ $location =~ "utils_2" ]]; then
          			entity_substitution "$file_in" "b"
          			component_substitution "$file_in" "b"
        		fi    
      			#pwd
	  		fi
		done
		cd ..
	elif [[ -f $file_out ]]; then
		sed -i "s/p4_adder_1/p4_adder_1_a/g" $file_out
		sed -i "s/p4_adder_2/p4_adder_2_b/g" $file_out
	fi
done

cd ..
