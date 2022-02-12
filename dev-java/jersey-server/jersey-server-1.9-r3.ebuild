# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.jersey:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jersey Server"
HOMEPAGE="https://eclipse-ee4j.github.io/jersey/"
SRC_URI="
	https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="|| ( CDDL-1.1 GPL-2-with-classpath-exception )"
SLOT="1"
KEYWORDS="~amd64"

# com/sun/jersey/server/impl/build.properties in pre-built JAR contains time
# stamp, making generated JAR impossible to be consistent
RESTRICT="test"

CP_DEPEND="
	>=dev-java/jersey-core-1.9:1
	>=dev-java/asm-3.1:3
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/jaxb-api-2.2:2
		dev-java/jakarta-ejb-api:3
		>=dev-java/mail-1.4:0
		>=dev-java/persistence-api-1.0:0
		>=dev-java/weld-osgi-bundle-1.1.0:0
		>=dev-java/ant-core-1.10.7:0
		>=dev-java/osgi-core-4.0:4
		java-virtuals/jsp-api:2.3
		java-virtuals/servlet-api:4.0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="
	ant-core
	mail
	persistence-api
	servlet-api-4.0
	jsp-api-2.3
	jaxb-api-2
	jakarta-ejb-api-3
	weld-osgi-bundle
	osgi-core-4
"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
