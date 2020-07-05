# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/logback-core-1.2.3.pom --download-uri https://repo.maven.apache.org/maven2/ch/qos/logback/logback-core/1.2.3/logback-core-1.2.3-sources.jar --slot 0 --keywords "~amd64" --ebuild logback-core-1.2.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="logback-core module"
HOMEPAGE="http://logback.qos.ch/logback-core"
SRC_URI="https://repo.maven.apache.org/maven2/ch/qos/logback/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="ch.qos.logback:logback-core:1.2.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.mail:mail:1.4 -> >=dev-java/oracle-javamail-1.5.2:0
# javax.servlet:javax.servlet-api:3.1.0 -> >=java-virtuals/servlet-api-4.0:4.0
# org.codehaus.janino:janino:3.0.6 -> >=dev-java/janino-3.0.6:0
# org.fusesource.jansi:jansi:1.9 -> >=dev-java/jansi-1.11:1.11

CDEPEND="
	>=dev-java/janino-3.0.6:0
	>=dev-java/jansi-1.11:1.11
	>=dev-java/oracle-javamail-1.5.2:0
	>=java-virtuals/servlet-api-4.0:4.0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="oracle-javamail,servlet-api-4.0,janino,jansi-1.11"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
