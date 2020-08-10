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

# @ECLASS-VARIABLE: JAVA_SRC_DIR
# @DESCRIPTION:
# A directory relative to ${S} which contains the source code.
# source code distributed by Maven Central are exactly the root of
# the source code, we need to assign them a separate directory to
# avoid the situation that the source code, the resources and the
# source code for testing are mixed in ${S}.
#
: ${JAVA_SRC_DIR:=src/main/java}

# @ECLASS-VARIABLE: JAVA_RESOURCE_DIRS
# @DEFAULT_UNSET
# @DESCRIPTION:
# A directory relative to ${S} which contains the resources of the
# application. Give it a default value to handle src_unpack.
: ${JAVA_RESOURCE_DIRS:=resources}

# @ECLASS-VARIABLE: JAVA_RESOURCE_DIRS
# @DEFAULT_UNSET
# @DESCRIPTION:
# A directory relative to ${S} which contains the source code for testing
# the application. Give it a default value to handle src_unpack.
: ${JAVA_TEST_SRC_DIR:=src/test/java}

# @FUNCTION: java-pkg-binjar_src_unpack
# @DESCRIPTION:
# Copy the binary jar into the expected place of java-pkg-simple.  Do
# not extract files from archive.
java-pkg-maven_src_unpack() {
	for file in ${A}; do
		case ${file} in
			*-test-sources.jar)
				mkdir -p "${S}"/${JAVA_TEST_SRC_DIR}\
					|| die "Could not create ${JAVA_TEST_SRC_DIR}"
				unzip -q -o "${DISTDIR}"/${file} -d "${S}"/${JAVA_TEST_SRC_DIR}\
					|| die "Could not unzip source code for testing" ;;
			*-sources.jar)
				mkdir -p "${S}"/${JAVA_SRC_DIR}\
					|| die "Could not create ${JAVA_SRC_DIR}"
				unzip -q -o "${DISTDIR}"/${file} -d "${S}"/${JAVA_SRC_DIR}\
					|| die "Could not unzip source code"
				if [[ -d "${S}"/${JAVA_SRC_DIR}/META-INF ]] ; then
					rm "${S}"/${JAVA_SRC_DIR}/META-INF -r || die
				fi ;;
			*)
				unpack ${file};;
		esac
	done

	# the resources (maven resources are bundled inside source file)
	mkdir -p $(dirname "${S}"/${JAVA_RESOURCE_DIRS}) || die
	cp "${S}"/${JAVA_SRC_DIR} "${S}"/${JAVA_RESOURCE_DIRS} -r || die
	find "${S}"/${JAVA_RESOURCE_DIRS} -type f ! -name \*.properties \
		-exec rm {} \; || die
}

