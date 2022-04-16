# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="io.netty:${PN}:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="NIO client-server framework for quick and easy network applications development"
HOMEPAGE="https://netty.io/"
SRC_URI="
	https://repo1.maven.org/maven2/io/${PN}/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/${PN}/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="3.10"
KEYWORDS="~amd64"

# japi-compliance-checker fails
RESTRICT="test"

CP_DEPEND="
	dev-java/jakarta-activation-api:1
	>=dev-java/bcpkix-1.50:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/jboss-logging-3.4.0:0
	>=dev-java/jboss-marshalling-1.3.18:0
	>=dev-java/jetty-npn-api-1.1.1:0
	dev-java/log4j-12-api:2
	>=dev-java/netty-tcnative-1.1.33.15:0
	>=dev-java/osgi-compendium-4.3.1:0
	>=dev-java/osgi-core-1.4.0:1
	>=dev-java/protobuf-java-3.11.4:0
	>=dev-java/slf4j-api-1.7.7:0
	java-virtuals/servlet-api:4.0
	dev-java/tomcat-jni:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVADOC_ARGS="-source 8"
