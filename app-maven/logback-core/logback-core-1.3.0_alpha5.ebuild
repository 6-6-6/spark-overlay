# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/logback-core-1.3.0-alpha5.pom --download-uri https://repo.maven.apache.org/maven2/ch/qos/logback/logback-core/1.3.0-alpha5/logback-core-1.3.0-alpha5-sources.jar --slot 0 --keywords "~amd64" --ebuild logback-core-1.3.0_alpha5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="logback-core module"
HOMEPAGE="http://logback.qos.ch/logback-core"
SRC_URI="https://repo.maven.apache.org/maven2/ch/qos/logback/${PN}/1.3.0-alpha5/${PN}-1.3.0-alpha5-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="ch.qos.logback:logback-core:1.3.0-alpha5"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-1.3.0-alpha5.pom
# edu.washington.cs.types.checker:checker-framework:1.7.0 -> >=app-maven/checker-framework-1.7.5:0
# javax.mail:javax.mail-api:1.6.2 -> >=dev-java/oracle-javamail-1.6.2:0
# javax.servlet:javax.servlet-api:3.1.0 -> >=java-virtuals/servlet-api-3.1:3.1
# org.codehaus.janino:janino:3.0.6 -> >=dev-java/janino-3.1.2:0
# org.fusesource.jansi:jansi:1.17 -> >=dev-java/jansi-1.18:0

CDEPEND="
	>=app-maven/checker-framework-1.7.5:0
	>=dev-java/janino-3.1.2:0
	>=dev-java/jansi-1.18:0
	>=dev-java/oracle-javamail-1.6.2:0
	>=java-virtuals/servlet-api-3.1:3.1
"


DEPEND="
	>=virtual/jdk-8:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-1.3.0-alpha5.pom
# com.sun.mail:javax.mail:1.6.2 -> >=dev-java/oracle-javamail-1.6.2:0
RDEPEND="
	>=virtual/jre-8:*
${CDEPEND}
	>=dev-java/oracle-javamail-1.6.2:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="checker-framework,oracle-javamail,servlet-api-3.1,janino,jansi,oracle-javamail"
