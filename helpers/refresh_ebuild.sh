#!/bin/bash

# call it inside a category
here=$(pwd)

for i in $(ls); do
	[[ -d ${i} ]] || continue
	[[ ${i} =~ curator* ]] || exit
	cd ${i}
	if ! ls *ebuild > /dev/null; then
		echo ${i}
	fi
	for j in $(ls *ebuild); do
		if grep java-pkg-binjar ${j}; then
			echo pass due to java-pkg-binjar
			continue
		fi
		python3 "${here}"/pseudoJebd.py ${j}
	done
	cd ..
done
