# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/curator-framework-2.13.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/curator/curator-framework/2.13.0/curator-framework-2.13.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/curator/curator-framework/2.13.0/curator-framework-2.13.0.jar --slot 0 --keywords "~amd64" --ebuild curator-framework-2.13.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.curator:curator-framework:2.13.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="High-level API that greatly simplifies using ZooKeeper."
HOMEPAGE="http://curator.apache.org/curator-framework"
SRC_URI="https://repo1.maven.org/maven2/org/apache/curator/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/curator/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.curator:curator-client:2.13.0 -> >=dev-java/curator-client-2.13.0:0

CDEPEND="
	>=dev-java/curator-client-2.13.0:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="curator-client"
JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=(
	""
)
JAVA_BINJAR_FILENAME="${P}-bin.jar"
