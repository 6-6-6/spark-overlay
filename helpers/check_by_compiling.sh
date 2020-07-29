#!/bin/bash

# call it inside a cateogry
here=$(pwd)

for i in $(ls); do
	if [[ -d ${i} ]]; then
		cd ${i}
		if [[ ! -f "done" ]]; then
			for i in $(ls *ebuild); do
				sudo USE="-test" emerge -1v ${i}
				if [[ $? -ne 0 ]]; then
					echo "${i}" >> ${here}/add_it_to_memo
				fi
			done
			touch done
		fi
		cd ..
	fi
done

find . -type f -name done -exec rm {} \;
