# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/okio-2.6.0.pom --download-uri https://repo.maven.apache.org/maven2/com/squareup/okio/okio/2.6.0/okio-2.6.0-sources.jar --slot 0 --keywords "~amd64" --ebuild okio-2.6.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"
MAVEN_ID="com.squareup.okio:okio:2.6.0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven java-pkg-simple-plugins

DESCRIPTION="A modern I/O API for Java"
HOMEPAGE="https://github.com/square/okio/"
SRC_URI="https://repo.maven.apache.org/maven2/com/squareup/${PN}/${PN}/${PV}/${P}-sources.jar
		https://repo.maven.apache.org/maven2/com/squareup/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jetbrains.kotlin:kotlin-stdlib:1.3.70 -> workaround
# org.jetbrains.kotlin:kotlin-stdlib-common:1.3.70 -> workaround

CDEPEND="
	dev-java/kotlin-common-bin:0
	dev-java/animal-sniffer-annotations:0
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

JAVA_GENTOO_CLASSPATH="kotlin-common-bin,animal-sniffer-annotations"
JAVA_SRC_DIR="src/main/java/jvmMain"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

KOTLINC_ARGS="-Xmulti-platform"

src_compile() {
	java-pkg-simple-plugins_src_compile
}
