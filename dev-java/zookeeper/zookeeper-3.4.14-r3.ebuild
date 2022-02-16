# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.zookeeper:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Server which enables highly reliable distributed coordination"
HOMEPAGE="https://zookeeper.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/apache-rat-tasks-0.6:0
	>=dev-java/audience-annotations-0.5.0:0
	>=dev-java/clover-4.2.1:0
	>=dev-java/dependency-check-ant-4.0.2:0
	>=dev-java/jdeb-1.1:0
	>=dev-java/jdiff-1.0.9:0
	>=dev-java/maven-ant-tasks-2.1.3:0
	>=dev-java/netty-3.10.6:0
	>=dev-java/spotbugs-annotations-3.1.9:0
	>=dev-java/wagon-http-2.4:0
	>=dev-java/commons-collections-3.2.2:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/jline-2.12.1:2
	dev-java/log4j-12-api:2
	>=dev-java/slf4j-api-1.7.28:0
	>=dev-java/slf4j-log4j12-1.7.28:0
	>=dev-java/xerces-2.12.0:2
	dev-java/jline:0
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
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" LICENSE.txt ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
