# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="${PN}-parent-${PV}"
JAVA_PKG_IUSE="doc source test"
MAVEN_ID="com.google.code.gson:gson:2.8.6"
JAVA_TESTING_FRAMEWORKS="junit-4 pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java library to convert JSON to Java objects and vice-versa"
HOMEPAGE="https://github.com/google/gson"
SRC_URI="https://github.com/google/${PN}/archive/${MY_P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="2.7"
KEYWORDS="~amd64 ~x86"

CDEPEND="test? ( dev-java/junit:4 )"

DEPEND=">=virtual/jdk-1.8"
RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${PN}-${MY_P}"
JAVA_SRC_DIR=(
	"${PN}/src/main/java"
	"${PN}/src/main/java-templates"
)

JAVA_TEST_GENTOO_CLASSPATH="junit-4"
JAVA_TEST_SRC_DIR="${PN}/src/test/java"

JAVA_RM_FILES=( "${JAVA_SRC_DIR[0]}/module-info.java" )

src_prepare() {
	java-pkg-2_src_prepare

	sed -i "s/\${project.version}/${PV}/" \
		${JAVA_SRC_DIR[1]}/com/google/gson/internal/GsonBuildConfig.java\
		|| die
}
