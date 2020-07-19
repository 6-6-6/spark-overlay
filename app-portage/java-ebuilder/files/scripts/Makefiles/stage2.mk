.PHONY: stage2

stage2: ${STAGE2_MAKEFILE} ${STAGE2_CACHE}

${STAGE3_MAKEFILE}: ${STAGE2_MAKEFILE}
	sed "s/stage1-cache/pre-stage3-cache/" $^ > $@

clean-stage2:
	rm -rf ${STAGE2_MAKEFILE} ${STAGE2_CACHE}
