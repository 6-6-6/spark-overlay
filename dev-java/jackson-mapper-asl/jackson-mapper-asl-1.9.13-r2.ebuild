# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.codehaus.jackson:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="High-performance data binding package built on Jackson JSON processor"
HOMEPAGE="https://github.com/FasterXML/jackson/wiki/JacksonRelease1.9"
SRC_URI="
	https://repo1.maven.org/maven2/org/codehaus/jackson/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/codehaus/jackson/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/jackson-core-asl-${PV}:0
	dev-java/joda-time:0
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

src_prepare() {
	eapply "${FILESDIR}/${P}-fix-for-java-9+-Module-class.patch"
	java-pkg-2_src_prepare
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	echo "${PV}" > org/codehaus/jackson/map/VERSION.txt ||
		die "Failed to create package version file"
	jar uf "${S}/${JAVA_JAR_FILENAME}" org/codehaus/jackson/map/VERSION.txt ||
		die "Failed to add package version file to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
