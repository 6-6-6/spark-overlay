# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spotbugs-annotations-4.0.3.pom --download-uri https://repo.maven.apache.org/maven2/com/github/spotbugs/spotbugs-annotations/4.0.3/spotbugs-annotations-4.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild spotbugs-annotations-4.0.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Annotations the SpotBugs tool supports"
HOMEPAGE="https://spotbugs.github.io/"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/spotbugs/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.spotbugs:spotbugs-annotations:4.0.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:jsr305:3.0.2 -> >=dev-java/jsr305-3.0.2:0

CDEPEND="
	>=dev-java/jsr305-3.0.2:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr305"
