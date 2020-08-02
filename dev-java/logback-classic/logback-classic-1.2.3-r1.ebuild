# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/logback-classic-1.2.3.pom --download-uri https://repo1.maven.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3-sources.jar --slot 0 --keywords "~amd64" --ebuild logback-classic-1.2.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="logback-classic module"
HOMEPAGE="http://logback.qos.ch/logback-classic"
SRC_URI="https://repo1.maven.org/maven2/ch/qos/logback/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/ch/qos/logback/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="ch.qos.logback:logback-classic:1.2.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ch.qos.logback:logback-core:1.2.3 -> >=dev-java/logback-core-1.2.3:0
# javax.mail:mail:1.4 -> >=dev-java/mail-1.4:0
# javax.servlet:javax.servlet-api:3.1.0 -> java-virtuals/servlet-api:4.0
# org.codehaus.groovy:groovy-all:2.4.0 -> >=dev-java/groovy-all-2.4.0:0
# org.codehaus.janino:janino:3.0.6 -> >=dev-java/janino-3.0.6:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/groovy-all-2.4.0:0
	>=dev-java/logback-core-1.2.3:0
	>=dev-java/mail-1.4:0
	>=dev-java/janino-3.0.6:0
	>=dev-java/slf4j-api-1.7.28:0
	java-virtuals/servlet-api:4.0
"


DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="logback-core,mail,servlet-api-4.0,groovy-all,janino,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

