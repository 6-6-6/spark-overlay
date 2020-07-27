
for i in $(ls); do
	[[ -d ${i} ]] || continue
	cd ${i}
	if grep java-pkg-binjar *ebuild; then
		echo pass due to java-pkg-binjar
	else
		$(python3 ../clean.py $(ls))
	fi
	cd ..
done
