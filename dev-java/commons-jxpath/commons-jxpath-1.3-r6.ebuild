# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Tests depend on mockrunner-jdk1.3-j2ee1, which is not available yet
JAVA_PKG_IUSE="doc source"
MAVEN_ID="commons-jxpath:${PN}:${PV}"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Applies XPath expressions to graphs of objects of all kinds"
HOMEPAGE="https://commons.apache.org/jxpath/"
SRC_URI="mirror://apache/commons/jxpath/source/${P}-src.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/commons-beanutils:1.7
	dev-java/jdom:0
	java-virtuals/servlet-api:3.0
"

DEPEND="
	${CP_DEPEND}
	>=virtual/jdk-1.8:*
	dev-java/xerces:2
"

RDEPEND="
	${CP_DEPEND}
	>=virtual/jre-1.8:*
"

DOCS=( NOTICE.txt )

S="${WORKDIR}/${P}-src"

JAVA_CLASSPATH_EXTRA="xerces-2"
JAVA_SRC_DIR="src/java"

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
