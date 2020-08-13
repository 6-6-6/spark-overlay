# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/logback-classic-1.0.13.pom --download-uri https://repo1.maven.org/maven2/ch/qos/logback/logback-classic/1.0.13/logback-classic-1.0.13-sources.jar --slot 0 --keywords "~amd64" --ebuild logback-classic-1.0.13-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="ch.qos.logback:logback-classic:1.0.13"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="logback-classic module"
HOMEPAGE="http://logback.qos.ch"
SRC_URI="https://repo1.maven.org/maven2/ch/qos/logback/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/ch/qos/logback/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="LGPL-3 EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ch.qos.logback:logback-core:1.0.13 -> >=dev-java/logback-core-1.0.13:0
# javax.mail:mail:1.4 -> >=dev-java/mail-1.4:0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# org.apache.geronimo.specs:geronimo-jms_1.1_spec:1.0 -> >=dev-java/geronimo-jms-1.0:1.1_spec
# org.codehaus.groovy:groovy-all:2.0.7 -> >=dev-java/groovy-all-2.0.7:0
# org.codehaus.janino:janino:2.6.1 -> >=dev-java/janino-2.7.0:0
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/geronimo-jms-1.0:1.1_spec
	>=dev-java/groovy-all-2.0.7:0
	>=dev-java/logback-core-1.0.13:0
	>=dev-java/mail-1.4:0
	>=dev-java/janino-2.7.0:0
	>=dev-java/slf4j-api-1.7.7:0
	java-virtuals/servlet-api:4.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
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

JAVA_GENTOO_CLASSPATH="logback-core,mail,servlet-api-4.0,geronimo-jms-1.1_spec,groovy-all,janino,slf4j-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
