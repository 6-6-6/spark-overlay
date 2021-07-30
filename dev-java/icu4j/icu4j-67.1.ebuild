# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc examples source test"
MAVEN_ID="com.ibm.icu:icu4j:67.1"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A set of Java libraries providing Unicode and Globalization support"
HOMEPAGE="http://www.icu-project.org/"
SRC_URI="https://github.com/unicode-org/icu/releases/download/release-67-1/icu4j-67_1-src.jar"

LICENSE="icu"
SLOT="67"
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~sparc-solaris ~x86-solaris"
IUSE=""

DEPEND=">=virtual/jdk-1.8"
RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}"

#JAVA_RM_FILES=(
#	tools/build/src/com/ibm/icu/dev/tool/docs/ICUTaglet.java
#)
