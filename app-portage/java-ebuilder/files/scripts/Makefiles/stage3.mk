.PHONY: post-stage3 stage3 clean-stage3

stage3: ${STAGE3_MAKEFILE} ${PRE_STAGE3_CACHE}
	make -f ${STAGE3_MAKEFILE} all -j -B

post-stage3: stage3-app-maven stage3-dev-libs stage3-java-virtuals stage3-dev-java stage3-sys-cluster

stage3-app-maven:
	cd ${MAVEN_OVERLAY_DIR}/app-maven && parallel ebuild '$$(echo {}/*.ebuild | cut -d\  -f1)' digest ::: * || echo ^@

stage3-dev-libs:
	cd ${MAVEN_OVERLAY_DIR}/dev-libs && parallel ebuild '$$(echo {}/*.ebuild | cut -d\  -f1)' digest ::: * || echo ^@

stage3-java-virtuals:
	cd ${MAVEN_OVERLAY_DIR}/java-virtuals && parallel ebuild '$$(echo {}/*.ebuild | cut -d\  -f1)' digest ::: *  || echo ^@

stage3-dev-java:
	cd ${MAVEN_OVERLAY_DIR}/dev-java && parallel ebuild '$$(echo {}/*.ebuild | cut -d\  -f1)' digest ::: *  || echo ^@

stage3-sys-cluster:
	cd ${MAVEN_OVERLAY_DIR}/sys-cluster && parallel ebuild '$$(echo {}/*.ebuild | cut -d\  -f1)' digest ::: *  || echo ^@

#clean-stage3:
#	make -f ${STAGE3_MAKEFILE} clean || echo No clean defined
#	rm -rf ${STAGE3_MAKEFILE} ${MAVEN_OVERLAY_DIR}/*
