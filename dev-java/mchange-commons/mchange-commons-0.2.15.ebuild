# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/mchange-commons-java-0.2.15.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/mchange/mchange-commons-java/0.2.15/mchange-commons-java-0.2.15-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/mchange/mchange-commons-java/0.2.15/mchange-commons-java-0.2.15.jar --slot 0 --keywords "~amd64" --ebuild mchange-commons-java-0.2.15.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="com.mchange:mchange-commons-java:0.2.15"
DESCRIPTION="mchange-commons-java"
HOMEPAGE="https://github.com/swaldman/mchange-commons-java"
SRC_URI="https://repo1.maven.org/maven2/com/mchange/${PN}-java/${PV}/${PN}-java-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/mchange/${PN}-java/${PV}/${PN}-java-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.typesafe:config:1.3.0 -> >=dev-java/typesafe-config-1.3.0:0
# log4j:log4j:[1.2.14,1.2.15),[1.2.140,1.2.150),[1.2.1400,1.2.1500),[1.2.14000,1.2.15000),[1.2.140000,1.2.150000) -> >=dev-java/log4j-1.2.17:0
# org.apache.logging.log4j:log4j-api:2.7 -> >=dev-java/log4j-api-2.7:0
# org.apache.logging.log4j:log4j-core:2.7 -> >=dev-java/log4j-core-2.7:0
# org.slf4j:slf4j-api:[1.7.5,1.7.6),[1.7.50,1.7.60),[1.7.500,1.7.600),[1.7.5000,1.7.6000),[1.7.50000,1.7.60000) -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/log4j-1.2.17:0
	>=dev-java/log4j-api-2.7:0
	>=dev-java/log4j-core-2.7:0
	>=dev-java/slf4j-api-1.7.7:0
	>=dev-java/typesafe-config-1.3.0:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="typesafe-config,log4j,log4j-api,log4j-core,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
