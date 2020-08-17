# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/okhttp-4.7.2.pom --download-uri https://repo1.maven.org/maven2/com/squareup/okhttp3/okhttp/4.7.2/okhttp-4.7.2-sources.jar --slot 0 --keywords "~amd64" --ebuild okhttp-4.7.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.squareup.okhttp3:okhttp:4.7.2"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Square's meticulous HTTP client for Java and Kotlin."
HOMEPAGE="https://square.github.io/okhttp/"
SRC_URI="https://repo1.maven.org/maven2/com/squareup/${PN}3/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.squareup.okio:okio:2.6.0 -> >=dev-java/okio-2.6.0:0
# org.jetbrains.kotlin:kotlin-stdlib:1.3.71 -> >=dev-java/kotlin-common-bin-1.3.72:0

CDEPEND="
	>=dev-java/kotlin-common-bin-1.3.72:0
	>=dev-java/okio-2.6.0:0
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

JAVA_GENTOO_CLASSPATH="okio,kotlin-common-bin"
JAVA_SRC_DIR="src/main/java"
