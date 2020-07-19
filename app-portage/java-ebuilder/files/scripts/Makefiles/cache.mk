
${CACHEDIR}/gentoo.cache.raw:
	java-ebuilder --refresh-cache -t "${PORTDIR}" --cache-file $@

${CACHEDIR}/gentoo.cache: ${CACHEDIR}/gentoo.cache.raw
	${FILL_CACHE} --dst-cache $@ --src-cache $^ --LUT ${LUTFILE}

${CACHEDIR}/java.cache.raw:
	java-ebuilder --refresh-cache -t "${JAVA_OVERLAY_DIR}" --cache-file $@

${CACHEDIR}/java.cache: ${CACHEDIR}/java.cache.raw
	${FILL_CACHE} --dst-cache $@ --src-cache $^ --LUT ${LUTFILE}

${STAGE0_CACHE}:
	java-ebuilder --refresh-cache -t ${EROOT}/var/lib/java-ebuilder/stage0/ --cache-file $@

${PRE_STAGE1_CACHE}: ${STAGE0_CACHE} ${CACHE_TARGET} 
	cat $^ > $@

${STAGE2_CACHE}: ${STAGE2_MAKEFILE}
	make -f "$^" all -j
	cp ${MAVEN_OVERLAY_DIR}/../stage0/* ${MAVEN_OVERLAY_DIR}/ -r
	java-ebuilder --refresh-cache -t "${MAVEN_OVERLAY_DIR}" --cache-file $@
	
${PRE_STAGE3_CACHE}: ${STAGE2_CACHE} ${CACHE_TARGET}
	cat $^ > $@

clean-cache:
	rm -rf ${CACHEDIR}/*
