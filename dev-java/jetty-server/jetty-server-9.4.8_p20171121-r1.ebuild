# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jetty-server-9.4.8.v20171121.pom --download-uri https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-server/9.4.8.v20171121/jetty-server-9.4.8.v20171121-sources.jar --slot 9 --keywords "~amd64" --ebuild jetty-server-9.4.8_p20171121-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.eclipse.jetty:jetty-server:9.4.8.v20171121"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The core jetty server artifact."
HOMEPAGE="http://www.eclipse.org/jetty"
SRC_URI="https://repo1.maven.org/maven2/org/eclipse/jetty/${PN}/9.4.8.v20171121/${PN}-9.4.8.v20171121-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/eclipse/jetty/${PN}/9.4.8.v20171121/${PN}-9.4.8.v20171121.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 Apache-2.0"
SLOT="9"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-9.4.8.v20171121.pom
# javax.servlet:javax.servlet-api:3.1.0 -> java-virtuals/servlet-api:4.0
# org.eclipse.jetty:jetty-http:9.4.8.v20171121 -> >=dev-java/jetty-http-9.4.8_p20171121:9
# org.eclipse.jetty:jetty-io:9.4.8.v20171121 -> >=dev-java/jetty-io-9.4.8_p20171121:9
# org.eclipse.jetty:jetty-jmx:9.4.8.v20171121 -> >=dev-java/jetty-jmx-9.4.8_p20171121:9

CDEPEND="
	>=dev-java/jetty-http-9.4.8_p20171121:9
	>=dev-java/jetty-io-9.4.8_p20171121:9
	>=dev-java/jetty-jmx-9.4.8_p20171121:9
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

JAVA_GENTOO_CLASSPATH="servlet-api-4.0,jetty-http-9,jetty-io-9,jetty-jmx-9"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
