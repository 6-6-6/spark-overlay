here=$(pwd)

for i in $(ls); do
	if [[ -d ${i} ]]; then
		cd ${i}
		if [[ ! -f "done" ]]; then
			for i in $(ls *ebuild); do
				sudo emerge -1v ${i} -a || sleep 60
			done
			touch done
		fi
		cd ..
	fi
done
		
