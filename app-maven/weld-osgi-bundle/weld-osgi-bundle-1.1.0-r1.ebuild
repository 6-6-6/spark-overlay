# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/weld-osgi-bundle-1.1.0.Final.pom --download-uri https://repo1.maven.org/maven2/org/jboss/weld/weld-osgi-bundle/1.1.0.Final/weld-osgi-bundle-1.1.0.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild weld-osgi-bundle-1.1.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Weld runtime packaged as an OSGi bundle"
HOMEPAGE="http://www.seamframework.org/Weld"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.weld:weld-osgi-bundle:1.1.0.Final"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.google.guava:guava:r06 -> >=dev-java/guava-29.0:0
# javax.enterprise:cdi-api:1.0-SP4 -> >=dev-java/cdi-api-1.2:1.2
# javax.inject:javax.inject:1 -> >=dev-java/javax-inject-1:0
# org.javassist:javassist:3.14.0-GA -> >=dev-java/javassist-3.18.2:3
# org.jboss.interceptor:jboss-interceptor-core:2.0.0.CR1 -> >=app-maven/jboss-interceptor-core-2.0.0:0
# org.jboss.interceptor:jboss-interceptor-spi:2.0.0.CR1 -> >=app-maven/jboss-interceptor-spi-2.0.0:0
# org.jboss.weld:weld-api:1.1.Final -> >=app-maven/weld-api-1.1:0
# org.jboss.weld:weld-core:1.1.0.Final -> >=app-maven/weld-core-1.1.0:0
# org.jboss.weld:weld-spi:1.1.Final -> >=app-maven/weld-spi-1.1:0

CDEPEND="
	>=app-maven/jboss-interceptor-core-2.0.0:0
	>=app-maven/jboss-interceptor-spi-2.0.0:0
	>=app-maven/weld-api-1.1:0
	>=app-maven/weld-core-1.1.0:0
	>=app-maven/weld-spi-1.1:0
	>=dev-java/cdi-api-1.2:1.2
	>=dev-java/guava-29.0:0
	>=dev-java/javassist-3.18.2:3
	>=dev-java/javax-inject-1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.slf4j:slf4j-jdk14:1.5.10 -> >=app-maven/slf4j-jdk14-1.5.10:0

DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=app-maven/slf4j-jdk14-1.5.10:0
	)
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="guava,cdi-api-1.2,javax-inject,javassist-3,jboss-interceptor-core,jboss-interceptor-spi,weld-api,weld-core,weld-spi"
JAVA_CLASSPATH_EXTRA="slf4j-jdk14"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
