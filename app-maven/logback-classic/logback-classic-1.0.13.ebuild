# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/logback-classic-1.0.13.pom --download-uri https://repo.maven.apache.org/maven2/ch/qos/logback/logback-classic/1.0.13/logback-classic-1.0.13-sources.jar --slot 0 --keywords "~amd64" --ebuild logback-classic-1.0.13.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="logback-classic module"
HOMEPAGE="http://logback.qos.ch"
SRC_URI="https://repo.maven.apache.org/maven2/ch/qos/logback/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="ch.qos.logback:logback-classic:1.0.13"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ch.qos.logback:logback-core:1.0.13 -> >=app-maven/logback-core-1.0.13:0
# javax.mail:mail:1.4 -> >=dev-java/oracle-javamail-1.5.2:0
# javax.servlet:servlet-api:2.5 -> >=java-virtuals/servlet-api-2.5:2.5
# org.apache.geronimo.specs:geronimo-jms_1.1_spec:1.0 -> >=app-maven/geronimo-jms-1.0:1.1_spec
# org.codehaus.groovy:groovy-all:2.0.7 -> >=dev-java/groovy-all-2.5.12:0
# org.codehaus.janino:janino:2.6.1 -> >=dev-java/janino-2.7.0:0
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-ext-1.7.5:0

CDEPEND="
	>=app-maven/geronimo-jms-1.0:1.1_spec
	>=app-maven/logback-core-1.0.13:0
	>=dev-java/groovy-all-2.5.12:0
	>=dev-java/janino-2.7.0:0
	>=dev-java/oracle-javamail-1.5.2:0
	>=dev-java/slf4j-ext-1.7.5:0
	>=java-virtuals/servlet-api-2.5:2.5
"


DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="logback-core,oracle-javamail,servlet-api-2.5,geronimo-jms-1.1_spec,groovy-all,janino,slf4j-ext"
