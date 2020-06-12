# Copyright 2004-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# @ECLASS: java-pkg-binjar.eclass
# @MAINTAINER:
# java@gentoo.org
# @AUTHOR:
# Java maintainers (java@gentoo.org)
# @BLURB: Eclass for packaging binary jar.
# @DESCRIPTION:
# This class is a short cut to install binary jar directly.  Binary jar
# is copied to the standard place together with a environment file.

inherit java-pkg-simple

EXPORT_FUNCTIONS src_unpack src_compile

# @FUNCTION: java-pkg-binjar_src_unpack
# @DESCRIPTION:
# Copy the binary jar into the expected place of java-pkg-simple.  Do
# not extract files from archive.
java-pkg-binjar_src_unpack() {
	cp "${DISTDIR}"/${A} "${S}"/${PN}.jar || die "cp failed"
}

# @FUNCTION: java-pkg-simple_src_compile
# @DESCRIPTION:
# Do nothing as we are doing binary install.
java-pkg-binjar_src_compile() { :; }
