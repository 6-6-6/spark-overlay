# Copyright 2004-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# @ECLASS: java-pkg-maven.eclass
# @MAINTAINER:
# zzy2529420793@gmail.com
# @AUTHOR:
# Zhang Zongyu
# @BLURB: Eclass for unpacking Maven aritfacts
# @DESCRIPTION:
# This class is an attempt to unpack Maven artifacts properly.

EXPORT_FUNCTIONS src_unpack

# @ECLASS_VARIABLE: JAVA_SRC_DIR
# @DESCRIPTION:
# A directory relative to ${S} which contains the source code.
# source code distributed by Maven Central are exactly the root of
# the source code, we need to assign them a separate directory to
# avoid the situation that the source code, the resources and the
# source code for testing are mixed in ${S}.
#
: ${JAVA_SRC_DIR:=src/main/java}

# @ECLASS_VARIABLE: JAVA_RESOURCE_DIRS
# @DEFAULT_UNSET
# @DESCRIPTION:
# A directory relative to ${S} which contains the resources of the
# application. Give it a default value to handle src_unpack.
: ${JAVA_RESOURCE_DIRS:=resources}

# @ECLASS_VARIABLE: JAVA_TEST_SRC_DIR
# @DEFAULT_UNSET
# @DESCRIPTION:
# A directory relative to ${S} which contains the source code for testing
# the application. Give it a default value to handle src_unpack.
: ${JAVA_TEST_SRC_DIR:=src/test/java}

# @ECLASS_VARIABLE: JAVA_BINJAR_FILENAME
# @DEFAULT_UNSET
# @DESCRIPTION:
# The name of the binary jar file that java-pkg-maven will not unpack

# @FUNCTION: java-pkg-binjar_src_unpack
# @DESCRIPTION:
# Copy the binary jar into the expected place of java-pkg-simple.  Do
# not extract files from archive.
java-pkg-maven_src_unpack() {
	# mkdir
	mkdir -p "${S}"/${JAVA_TEST_SRC_DIR}\
		|| die "Could not create ${JAVA_TEST_SRC_DIR}"
	mkdir -p "${S}"/${JAVA_SRC_DIR}\
		|| die "Could not create ${JAVA_SRC_DIR}"

	# unpack files
	for file in ${A}; do
		case ${file} in
			*-test-sources.jar)
				unzip -q -o "${DISTDIR}"/${file} -d "${S}"/${JAVA_TEST_SRC_DIR}\
					|| die "Could not unzip source code for testing" ;;
			*-sources.jar)
				unzip -q -o "${DISTDIR}"/${file} -d "${S}"/${JAVA_SRC_DIR}\
					|| die "Could not unzip source code"
				# META-INF may contain certain information about the pkg
				if [[ -d "${S}"/${JAVA_SRC_DIR}/META-INF ]] ; then
					mv "${S}"/${JAVA_SRC_DIR}/META-INF "${S}"/META-INF-src || die
				fi ;;
			${JAVA_BINJAR_FILENAME}) ;;
			*)
				unpack ${file};;
		esac
	done

	# the resources (maven resources are bundled inside source file)
	mkdir -p $(dirname "${S}"/${JAVA_RESOURCE_DIRS}) || die
	cp "${S}"/${JAVA_SRC_DIR} "${S}"/${JAVA_RESOURCE_DIRS} -r || die
	# keep only the properties
	find "${S}"/${JAVA_RESOURCE_DIRS} -type f ! -name \*.properties \
		-exec rm {} \; || die

	# copy information for META-INF
	mkdir -p "${S}/${JAVA_RESOURCE_DIRS}/META-INF/" || die
	## [service loader](https://docs.oracle.com/javase/6/docs/api/java/util/ServiceLoader.html)
	if [[ -d "${S}"/META-INF-src/services ]] ; then
		mv "${S}"/META-INF-src/services "${S}/${JAVA_RESOURCE_DIRS}/META-INF/" || die
	fi

	# clear unused directories, and create a dummy if everything got removed
	find "${S}"/${JAVA_RESOURCE_DIRS} -type d -empty -delete || die
	mkdir -p "${S}"/${JAVA_RESOURCE_DIRS}
}

