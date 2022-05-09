# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="org.openjdk.jmh:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JMH benchmark generator, based on annotation processors"
HOMEPAGE="https://openjdk.java.net/projects/code-tools/jmh/"
SRC_URI="
	https://repo1.maven.org/maven2/org/openjdk/jmh/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/openjdk/jmh/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	>=dev-java/jmh-core-${PV}:0
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
	jar uf "${S}/${JAVA_JAR_FILENAME}" LICENSE THIRD-PARTY || \
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
