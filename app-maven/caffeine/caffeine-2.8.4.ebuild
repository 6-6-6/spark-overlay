# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/caffeine-2.8.4.pom --download-uri https://repo.maven.apache.org/maven2/com/github/ben-manes/caffeine/caffeine/2.8.4/caffeine-2.8.4-sources.jar --slot 0 --keywords "~amd64" --ebuild caffeine-2.8.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A high performance caching library"
HOMEPAGE="https://github.com/ben-manes/caffeine"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/ben-manes/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.ben-manes.caffeine:caffeine:2.8.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.errorprone:error_prone_annotations:2.3.4 -> >=dev-java/error-prone-annotations-2.4.0:prone_annotations
# org.checkerframework:checker-qual:3.4.0 -> >=app-maven/checker-qual-3.4.1:0

CDEPEND="
	>=app-maven/checker-qual-3.4.1:0
	>=dev-java/error-prone-annotations-2.4.0:prone_annotations
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

JAVA_GENTOO_CLASSPATH="error-prone-annotations-prone_annotations,checker-qual"
