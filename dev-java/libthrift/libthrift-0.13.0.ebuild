# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/libthrift-0.13.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/apache/thrift/libthrift/0.13.0/libthrift-0.13.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/apache/thrift/libthrift/0.13.0/libthrift-0.13.0.jar --slot 0 --keywords "~amd64" --ebuild libthrift-0.13.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.thrift:libthrift:0.13.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Thrift is a software framework for scalable cross-language services development."
HOMEPAGE="http://thrift.apache.org"
SRC_URI="https://repo1.maven.org/maven2/org/apache/thrift/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/thrift/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.annotation:javax.annotation-api:1.3.2 -> >=dev-java/javax-annotation-api-1.3.2:0
# org.apache.httpcomponents:httpclient:4.5.6 -> >=dev-java/httpclient-4.5.6:0
# org.apache.httpcomponents:httpcore:4.4.1 -> >=dev-java/httpcomponents-core-4.4.1:4.4
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-1.7.28:0

CDEPEND="
	>=dev-java/httpclient-4.5.6:0
	>=dev-java/httpcomponents-core-4.4.1:4.4
	>=dev-java/javax-annotation-api-1.3.2:0
	>=dev-java/slf4j-api-1.7.28:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		java-virtuals/servlet-api:4.0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="javax-annotation-api,httpclient,httpcomponents-core-4.4,slf4j-api"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
