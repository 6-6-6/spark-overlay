
MAKEFILE_DIR?=./

include ${MAKEFILE_DIR}/environment.mk
include ${MAKEFILE_DIR}/cache.mk
include ${MAKEFILE_DIR}/stage1.mk
include ${MAKEFILE_DIR}/stage2.mk
include ${MAKEFILE_DIR}/stage3.mk

#include ${STAGE2_MAKEFILE}

.PHONY: stage3 clean

all: stage3

clean: clean-cache clean-stage1 clean-stage2 clean-stage3
