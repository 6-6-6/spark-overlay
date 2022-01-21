# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2 java-pkg-simple java-pkg-simple-plugins

DESCRIPTION="A demo that uses spark-core to perform Monte Carlo simulations"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

CDEPEND="
	dev-java/spark-core:2.12
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="spark-core-2.12"

src_unpack() {
	cp "${FILESDIR}"/*scala "${S}"
}

src_compile() {
	java-pkg-simple-plugins_src_compile
}

src_test() {
	local deps_cp="$(java-pkg_getjars --build-only --with-dependencies \
		"${JAVA_GENTOO_CLASSPATH}")"
	CLASSPATH="${JAVA_JAR_FILENAME}:${deps_cp}" scala-2.12 \
		-Dspark.testing.memory=500000000 net.novazy.spark.demo.main \
		"$(nproc)" || die "Failed to run the Spark demo"
}

src_install() {
	java-pkg-simple_src_install

	dobin "${FILESDIR}/${PN}-${SLOT}"
}
