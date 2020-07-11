# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/okio-2.6.0.pom --download-uri https://repo.maven.apache.org/maven2/com/squareup/okio/okio/2.6.0/okio-2.6.0-sources.jar --slot 0 --keywords "~amd64" --ebuild okio-2.6.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="A modern I/O API for Java"
HOMEPAGE="https://github.com/square/okio/"
SRC_URI="https://repo.maven.apache.org/maven2/com/squareup/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.squareup.okio:okio:2.6.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jetbrains.kotlin:kotlin-stdlib:1.3.70 -> workaround
# org.jetbrains.kotlin:kotlin-stdlib-common:1.3.70 -> workaround

CDEPEND="
	dev-java/kotlin-common-bin
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

JAVA_GENTOO_CLASSPATH="kotlin-common-bin"
JAVA_SRC_DIR="src/main/java"

