# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/classmate-1.3.0.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/classmate/1.3.0/classmate-1.3.0-sources.jar --slot 0 --keywords "~amd64" --ebuild classmate-1.3.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Library for introspecting types with full generic information
        including resolving of field and method types."
HOMEPAGE="http://github.com/cowtowncoder/java-classmate"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml:classmate:1.3.0"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
