# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/logback-core-1.2.3.pom --download-uri https://repo1.maven.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3-sources.jar --slot 0 --keywords "~amd64" --ebuild logback-core-1.2.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="ch.qos.logback:logback-core:1.2.3"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="logback-core module"
HOMEPAGE="http://logback.qos.ch/logback-core"
SRC_URI="https://repo1.maven.org/maven2/ch/qos/logback/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/ch/qos/logback/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="LGPL-3 EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.mail:mail:1.4 -> >=dev-java/mail-1.4:0
# javax.servlet:javax.servlet-api:3.1.0 -> java-virtuals/servlet-api:4.0
# org.codehaus.janino:janino:3.0.6 -> >=dev-java/janino-3.0.6:0
# org.fusesource.jansi:jansi:1.9 -> >=dev-java/jansi-1.11-r2:0

CDEPEND="
	>=dev-java/mail-1.4:0
	>=dev-java/janino-3.0.6:0
	>=dev-java/jansi-1.11-r2:0
	java-virtuals/servlet-api:4.0
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

JAVA_GENTOO_CLASSPATH="mail,servlet-api-4.0,janino,jansi"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
