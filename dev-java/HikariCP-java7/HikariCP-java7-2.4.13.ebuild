# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/HikariCP-java7-2.4.13.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/zaxxer/HikariCP-java7/2.4.13/HikariCP-java7-2.4.13-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/zaxxer/HikariCP-java7/2.4.13/HikariCP-java7-2.4.13.jar --slot 0 --keywords "~amd64" --ebuild HikariCP-java7-2.4.13.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.zaxxer:HikariCP-java7:2.4.13"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Ultimate JDBC Connection Pool"
HOMEPAGE="https://github.com/brettwooldridge/HikariCP"
SRC_URI="https://repo1.maven.org/maven2/com/zaxxer/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/zaxxer/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.javassist:javassist:3.20.0-GA -> >=dev-java/javassist-3.21.0:3
# org.slf4j:slf4j-api:1.7.21 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/javassist-3.21.0:3
	>=dev-java/slf4j-api-1.7.28:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# io.dropwizard.metrics:metrics-core:3.1.2 -> >=dev-java/metrics-core-4.1.1:0
# io.dropwizard.metrics:metrics-healthchecks:3.1.2 -> >=dev-java/metrics-healthchecks-4.1.1:0
# io.prometheus:simpleclient:0.0.16 -> >=dev-java/simpleclient-0.0.16:0
# org.hibernate:hibernate-core:5.0.9.Final -> >=dev-java/hibernate-core-5.2.13:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/simpleclient-0.0.16:0
		>=dev-java/hibernate-core-5.2.13:0
		>=dev-java/metrics-core-4.1.1:0
		>=dev-java/metrics-healthchecks-4.1.1:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="javassist-3,slf4j-api"
JAVA_CLASSPATH_EXTRA="metrics-core,metrics-healthchecks,simpleclient,hibernate-core"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
