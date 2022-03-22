# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.enterprise:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Contexts and Dependency Injection for the Java EE platform"
HOMEPAGE="https://www.cdi-spec.org/"
SRC_URI="
	https://repo1.maven.org/maven2/javax/enterprise/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/enterprise/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"

LICENSE="Apache-2.0"
SLOT="1.2"
KEYWORDS="~amd64 ~x86"

# japi-compliance-checker would fail due to
# return value type change of some methods
RESTRICT="test"

CP_DEPEND="
	dev-java/javax-inject:0
	dev-java/jakarta-interceptor-api:1
	java-virtuals/servlet-api:3.0
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

src_compile() {
	java-pkg-simple_src_compile
	java-pkg_addres "${PN}.jar" . -name "*.xsd"
}
