# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.jboss.logmanager:jboss-logmanager:1.5.2.Final"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JBoss logging framework"
HOMEPAGE="https://www.jboss.org/"
SRC_URI="https://github.com/${PN/logmanager/logging}/${PN}/archive/${PV}.Final.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND="dev-java/jboss-modules:0"
RDEPEND=">=virtual/jre-1.8
		${CDEPEND}"
DEPEND=">=virtual/jdk-1.8
		${CDEPEND}"

S="${WORKDIR}/${P}.Final/"

JAVA_SRC_DIR="src/main/java"
JAVA_GENTOO_CLASSPATH="jboss-modules"

java_prepare() {
	rm pom.xml || die
}
