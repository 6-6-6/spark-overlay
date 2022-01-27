# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.owasp:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Identify and report publicly disclosed vulnerabilities in project's dependencies"
HOMEPAGE="https://owasp.org/www-project-dependency-check/"
SRC_URI="
	https://repo1.maven.org/maven2/org/owasp/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/owasp/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Upstream pre-built JAR contains lots of non-Java-class files
RESTRICT="test"

CP_DEPEND="
	>=dev-java/commons-text-1.6:0
	>=dev-java/dependency-check-utils-4.0.2:0
	>=dev-java/javax-json-1.0.4:0
	>=dev-java/lucene-analyzers-common-7.6.0:0
	>=dev-java/lucene-queryparser-7.6.0:0
	>=dev-java/mailapi-1.6.3:0
	>=dev-java/retirejs-core-3.0.1:0
	>=dev-java/semver4j-2.2.0:0
	>=dev-java/commons-collections-3.2.2:0
	>=dev-java/commons-compress-1.20:0
	>=dev-java/commons-io-2.6:1
	>=dev-java/findbugs-annotations-3.0.12:3
	>=dev-java/gson-2.8.7:2.6
	>=dev-java/guava-29.0:0
	>=dev-java/joda-time-2.7:0
	>=dev-java/jsoup-1.11.3:0
	>=dev-java/lucene-7.6.0:0
	>=dev-java/slf4j-api-1.7.28:0
	dev-java/commons-lang:2.1
	dev-java/jaxb-api:2
	dev-java/velocity:1.7
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
	>=dev-java/h2-1.4.196:0
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_install() {
	java-pkg-simple_src_install
	java-pkg_register-dependency h2
}
