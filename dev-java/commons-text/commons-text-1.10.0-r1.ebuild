# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.apache.commons:${PN}:${PV}"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A Java library focused on algorithms working on strings"
HOMEPAGE="https://commons.apache.org/proper/commons-text/"
SRC_URI="mirror://apache/commons/text/source/commons-text-${PV}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/commons-lang:3.6
"
DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${P}-src"

JAVA_AUTOMATIC_MODULE_NAME="org.apache.commons.text"
JAVA_ENCODING="ISO-8859-1"

JAVA_SRC_DIR="src/main/java"
