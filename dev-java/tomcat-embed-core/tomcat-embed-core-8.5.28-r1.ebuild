# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/tomcat-embed-core-8.5.28.pom --download-uri https://repo1.maven.org/maven2/org/apache/tomcat/embed/tomcat-embed-core/8.5.28/tomcat-embed-core-8.5.28-sources.jar --slot 0 --keywords "~amd64" --ebuild tomcat-embed-core-8.5.28-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Core Tomcat implementation"
HOMEPAGE="http://tomcat.apache.org/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/tomcat/embed/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/tomcat/embed/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.tomcat.embed:tomcat-embed-core:8.5.28"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.tomcat:tomcat-annotations-api:8.5.28 -> >=dev-java/tomcat-annotations-api-8.5.28:0

CDEPEND="
	>=dev-java/tomcat-annotations-api-8.5.28:0
	java-virtuals/servlet-api:4.0
	java-virtuals/ejb-api:0
	dev-java/javax-mail:0
	dev-java/javax-persistence:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="tomcat-annotations-api,servlet-api-4.0,ejb-api,javax-mail,javax-persistence"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

