# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/snappy-java-1.1.8.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/1.1.8/snappy-java-1.1.8-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/1.1.8/snappy-java-1.1.8.jar --slot 0 --keywords "~amd64" --ebuild snappy-java-1.1.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.xerial.snappy:snappy-java:1.1.8"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="snappy-java: A fast compression/decompression library"
HOMEPAGE="https://github.com/xerial/snappy-java"
SRC_URI="https://repo1.maven.org/maven2/org/xerial/snappy/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/xerial/snappy/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:org.osgi.core:4.3.0 -> >=dev-java/osgi-core-api-5.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/osgi-core-api-5.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="osgi-core-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
