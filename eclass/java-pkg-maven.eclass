# Copyright 2004-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# @ECLASS: java-pkg-binjar.eclass
# @MAINTAINER:
# zzy2529420793@gmail.com
# @AUTHOR:
# Zhang Zongyu
# @BLURB: Eclass for unpacking Maven aritfacts
# @DESCRIPTION:
# This class is an attempt to unpack Maven artifacts properly.

EXPORT_FUNCTIONS src_unpack

# @ECLASS-VARIABLE: JAVA_SOURCE_FILENAME
# @DESCRIPTION:
# The filename of the source code.
: ${JAVA_SOURCE_FILENAME:=${P}-sources.jar}

# @ECLASS-VARIABLE: JAVA_TEST_SOURCE_FILENAME
# @DESCRIPTION:
# The filename of the source code for launch testing.
: ${JAVA_TEST_SOURCE_FILENAME:=${P}-test-sources.jar}

# @ECLASS-VARIABLE: JAVA_RESOURCE_DIRS
# @DEFAULT_UNSET
# @DESCRIPTION:
# A directory relative to ${S} which contain the resources of the
# application. Give it a default value to handle src_unpack.
: ${JAVA_RESOURCE_DIRS:=src/main/resources}

# @FUNCTION: java-pkg-binjar_src_unpack
# @DESCRIPTION:
# Copy the binary jar into the expected place of java-pkg-simple.  Do
# not extract files from archive.
java-pkg-maven_src_unpack() {
	for file in ${A}; do
		case ${file} in
			${JAVA_BINJAR_FILENAME}) ;;
			${JAVA_SOURCE_FILENAME})
				mkdir -p "${S}"/${JAVA_SRC_DIR}\
					|| die "Could not create ${JAVA_SRC_DIR}"
				unzip -q -o "${DISTDIR}"/${file} -d "${S}"/${JAVA_SRC_DIR}\
					|| die "Could not unzip source code" ;;
			${JAVA_TEST_SOURCE_FILENAME})
				mkdir -p "${S}"/${JAVA_TEST_SRC_DIR}\
					|| die "Could not create ${JAVA_TEST_SRC_DIR}"
				unzip -q -o "${DISTDIR}"/${file} -d "${S}"/${JAVA_TEST_SRC_DIR}\
					|| die "Could not unzip source code for testing" ;;
		esac
	done

	# the resources (maven resources are bundled inside source file)
	cp "${S}"/${JAVA_SRC_DIR} "${S}"/${JAVA_RESOURCE_DIRS} -r || die
	rm "${S}"/${JAVA_RESOURCE_DIRS}/META-INF -r || die
	find "${S}"/${JAVA_RESOURCE_DIRS} -type f ! -name \*.properties \
		-exec rm {} \; || die
}

