# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-crypto-1.0.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-crypto/1.0.0/commons-crypto-1.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-crypto-1.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.apache.commons:commons-crypto:1.0.0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Commons Crypto is a cryptographic library optimized with AES-NI (Advanced Encryption Standard New Instructions)."
HOMEPAGE="http://commons.apache.org/proper/commons-crypto/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${PN}/${PV}/${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# net.java.dev.jna:jna:4.2.2 -> dev-java/jna:4

CDEPEND="
	>=dev-java/jna-4.2.2:4
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

JAVA_ENCODING="iso-8859-1"
JAVA_SRC_DIR="src/main/java"

JAVA_GENTOO_CLASSPATH="jna-4"
JAVA_RESOURCE_DIRS=(
	"src/main/resources"
)
