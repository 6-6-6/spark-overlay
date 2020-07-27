# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jts-core-1.17.0.pom --download-uri https://repo1.maven.org/maven2/org/locationtech/jts/jts-core/1.17.0/jts-core-1.17.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jts-core-1.17.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The JTS Topology Suite is an API for 2D linear geometry predicates and functions."
HOMEPAGE="https://www.locationtech.org/projects/technology.jts/jts-modules/jts-core"
SRC_URI="https://repo1.maven.org/maven2/org/locationtech/jts/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/locationtech/jts/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="1"
KEYWORDS="~amd64"
MAVEN_ID="org.locationtech.jts:jts-core:1.17.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip -q ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
