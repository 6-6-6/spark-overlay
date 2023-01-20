# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="org.slf4j:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="junit-4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The slf4j API"
HOMEPAGE="https://www.slf4j.org"
SRC_URI="https://github.com/qos-ch/slf4j/archive/v_${PV}.tar.gz -> slf4j-${PV}.tar.gz"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

BDEPEND="
	app-arch/zip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

DOCS=( ../README.md )

S="${WORKDIR}/slf4j-v_${PV}/${PN}"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS="src/main/resources"

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="src/test/java"

JAVA_TEST_EXCLUDES=(
	# java.lang.InstantiationException - not run by upstream anyway
	"org.slf4j.helpers.MultithreadedInitializationTest"
)

src_compile() {
	java-pkg-simple_src_compile

	# Avoid test errors like:
	#	Caused by: java.lang.UnsupportedOperationException: This code should never make it into the jar
	#		at org.slf4j.impl
	zip -d ${PN}.jar org/slf4j/impl/\* || die "Failed to remove impl files"
}
