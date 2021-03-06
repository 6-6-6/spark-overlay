# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.slf4j:slf4j-api:1.7.28"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Simple Logging Facade for Java"
HOMEPAGE="http://www.slf4j.org/"
SRC_URI="https://github.com/qos-ch/slf4j/archive/v_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 ppc64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=virtual/jre-1.8"
DEPEND=">=virtual/jdk-1.8
	app-arch/unzip
	test? (
		dev-java/junit:4
		dev-java/ant-junit:0
	)"

S="${WORKDIR}/slf4j-v_${PV}/${PN}"

JAVA_ANT_REWRITE_CLASSPATH="yes"
EANT_TEST_GENTOO_CLASSPATH="junit-4"
EANT_TEST_ANT_TASKS="ant-junit"
EANT_EXTRA_ARGS="-Dmaven.build.finalName=${PN}"

java_prepare() {
	cp "${FILESDIR}"/"${PV}"-build.xml build.xml || die
	find "${WORKDIR}" -iname '*.jar' -delete || die
}

src_install() {
	java-pkg_dojar target/${PN}.jar
	use doc && java-pkg_dojavadoc target/site/apidocs
	use source && java-pkg_dosrc src/main/java/org
}
