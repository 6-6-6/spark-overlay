# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/ehcache-core-2.6.11.pom --download-uri https://repo1.maven.org/maven2/net/sf/ehcache/ehcache-core/2.6.11/ehcache-core-2.6.11-sources.jar --slot 0 --keywords "~amd64" --ebuild ehcache-core-2.6.11-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.sf.ehcache:ehcache-core:2.6.11"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="This is the ehcache core module. Pair it with other modules for added functionality."
HOMEPAGE="http://ehcache.org"
SRC_URI="https://repo1.maven.org/maven2/net/sf/${PN}/${PN}-core/${PV}/${PN}-core-${PV}-sources.jar
	https://repo1.maven.org/maven2/net/sf/${PN}/${PN}-core/${PV}/${PN}-core-${PV}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="2"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.6.1 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0
	dev-java/quartz:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:servlet-api:2.4 -> java-virtuals/servlet-api:4.0
# javax.transaction:jta:1.1 -> >=dev-java/jta-1.1:0
# org.hibernate:hibernate-core:3.5.1-Final -> >=dev-java/hibernate-core-5.2.13:0
# org.slf4j:slf4j-jdk14:1.6.1 -> >=dev-java/slf4j-jdk14-1.6.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/hibernate-core-5.2.13:0
	>=dev-java/jta-1.1:0
	>=dev-java/slf4j-jdk14-1.6.1:0
	java-virtuals/servlet-api:4.0
	)
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="slf4j-api,quartz"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0,jta,hibernate-core,slf4j-jdk14"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
