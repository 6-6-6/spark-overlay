# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hk2-api-2.6.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/hk2/hk2-api/2.6.1/hk2-api-2.6.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hk2-api-2.6.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="HK2 API module"
HOMEPAGE="https://github.com/eclipse-ee4j/glassfish-hk2/hk2-api"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/hk2/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/hk2/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.hk2:hk2-api:2.6.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.glassfish.hk2:hk2-utils:2.6.1 -> >=dev-java/hk2-utils-2.6.1:0
# org.glassfish.hk2:osgi-resource-locator:1.0.3 -> >=dev-java/osgi-resource-locator-1.0.3:0
# org.glassfish.hk2.external:aopalliance-repackaged:2.6.1 -> >=dev-java/aopalliance-repackaged-2.6.1:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=dev-java/jakarta-inject-2.6.1:0

CDEPEND="
	>=dev-java/aopalliance-repackaged-2.6.1:0
	>=dev-java/hk2-utils-2.6.1:0
	>=dev-java/jakarta-inject-2.6.1:0
	>=dev-java/osgi-resource-locator-1.0.3:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="hk2-utils,osgi-resource-locator,aopalliance-repackaged,jakarta-inject"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

