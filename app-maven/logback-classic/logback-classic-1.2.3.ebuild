# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/logback-classic-1.2.3.pom --download-uri https://repo.maven.apache.org/maven2/ch/qos/logback/logback-classic/1.2.3/logback-classic-1.2.3-sources.jar --slot 0 --keywords "~amd64" --ebuild logback-classic-1.2.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="logback-classic module"
HOMEPAGE="http://logback.qos.ch/logback-classic"
SRC_URI="https://repo.maven.apache.org/maven2/ch/qos/logback/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="ch.qos.logback:logback-classic:1.2.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ch.qos.logback:logback-core:1.2.3 -> >=app-maven/logback-core-1.2.3:0
# javax.mail:mail:1.4 -> >=dev-java/oracle-javamail-1.5.2:0
# javax.servlet:javax.servlet-api:3.1.0 -> >=java-virtuals/servlet-api-3.1:3.1
# org.codehaus.groovy:groovy-all:2.4.0 -> >=dev-java/groovy-all-2.5.12:0
# org.codehaus.janino:janino:3.0.6 -> >=dev-java/janino-3.1.2:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=app-maven/logback-core-1.2.3:0
	>=dev-java/groovy-all-2.5.12:0
	>=dev-java/janino-3.1.2:0
	>=dev-java/oracle-javamail-1.5.2:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
	>=java-virtuals/servlet-api-3.1:3.1
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

JAVA_GENTOO_CLASSPATH="logback-core,oracle-javamail,servlet-api-3.1,groovy-all,janino,slf4j-api"
