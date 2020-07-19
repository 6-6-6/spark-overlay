#

# determine EROOT
EROOT=$(shell python -c "import portage;print(portage.root)")

# java-ebuilder.conf
CONFIG?=${EROOT}/etc/java-ebuilder.conf
include ${CONFIG}

# Aritifact whose dependency to be fill
HANDMADE_DIR?=${EROOT}/var/lib/java-ebuilder/stage0/

# shells
TSH=${EROOT}/usr/lib/java-ebuilder/tree.sh
TSH_WRAPPER=${EROOT}/usr/lib/java-ebuilder/tree-wrapper.sh
FILL_CACHE=${EROOT}/usr/lib/java-ebuilder/LUT/fill_cache
COMPARE_MVN_VERSION=${EROOT}/usr/lib/java-ebuilder/mvnVersion/compare_maven_version

# stage
SEED_DIR?=${EROOT}/var/lib/java-ebuilder/seed/
STAGE0_DIR?=${EROOT}/var/lib/java-ebuilder/stage0/
STAGE1_DIR?=${EROOT}/var/lib/java-ebuilder/stage1/
STAGE2_MAKEFILE?=/tmp/stage2.mk
STAGE3_MAKEFILE?=/tmp/maven.mk

# PORTAGE REPOS
## portage dir
NULLDIR=$(shell portageq get_repo_path ${EROOT} wxxwswddadafef22SA)
PORTDIR?=$(shell portageq get_repo_path ${EROOT} gentoo)
JAVA_OVERLAY_DIR?=$(shell portageq get_repo_path ${EROOT} java-overlay)

# cache
LUTFILE?=${EROOT}/usr/lib/java-ebuilder/LUT/LUT
STAGE0_CACHE?=${CACHEDIR}/stage0-cache
PRE_STAGE1_CACHE?=${CACHEDIR}/pre-stage1-cache
PRE_STAGE3_CACHE?=${CACHEDIR}/pre-stage3-cache
STAGE2_CACHE?=${CACHEDIR}/stage2-cache
ifneq (${PORTDIR}, ${NULLDIR})
	CACHE_TARGET+=${CACHEDIR}/gentoo.cache
endif
ifneq (${JAVA_OVERLAY_DIR}, ${NULLDIR})
	CACHE_TARGET+=${CACHEDIR}/java.cache
endif


null:
	echo ${HANDMADE_DIR}
	echo ${HANDMADE}
