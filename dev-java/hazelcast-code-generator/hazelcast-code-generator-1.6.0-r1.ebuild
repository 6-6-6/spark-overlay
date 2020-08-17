# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hazelcast-code-generator-1.6.0.pom --download-uri https://repo1.maven.org/maven2/com/hazelcast/hazelcast-code-generator/1.6.0/hazelcast-code-generator-1.6.0-sources.jar --slot 0 --keywords "~amd64" --ebuild hazelcast-code-generator-1.6.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.hazelcast:hazelcast-code-generator:1.6.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Client Protocol of Hazelcast In-Memory DataGrid"
HOMEPAGE="http://www.hazelcast.com/hazelcast-code-generator/"
SRC_URI="https://repo1.maven.org/maven2/com/hazelcast/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/hazelcast/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.freemarker:freemarker:2.3.23 -> >=dev-java/freemarker-2.3.23:0

CDEPEND="
	>=dev-java/freemarker-2.3.23:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:annotations:3.0.0 -> >=dev-java/findbugs-annotations-3.0.12:3
# javax.cache:cache-api:1.0.0 -> >=dev-java/cache-api-1.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/cache-api-1.0.0:0
		>=dev-java/findbugs-annotations-3.0.12:3
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="freemarker"
JAVA_CLASSPATH_EXTRA="findbugs-annotations-3,cache-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
