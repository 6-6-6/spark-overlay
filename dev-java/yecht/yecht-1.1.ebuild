# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jruby:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The \"Yecht\" implementation of Ruby 1.8's yaml parser \"Syck\""
HOMEPAGE="https://github.com/jruby/yecht"
SRC_URI="
	https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="EPL-1.0 GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

# Due to circular dependency with dev-java/jruby-core, this package might need
# to be first installed with USE="binary".  With this USE flag, jruby-core is
# not guaranteed to be installed during build time, and running pkgdiff tests
# under such situation may end up with a missing package error.
RESTRICT="binary? ( test )"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		>=dev-java/jruby-core-1.7.22:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jruby-core"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	eapply "${FILESDIR}/${P}-fix-for-java-9+-Module-class.patch"
	java-pkg-2_src_prepare
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" okay{,.rb} yaml{,.rb} ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
