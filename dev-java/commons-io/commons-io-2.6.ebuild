# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-io-2.6.pom --download-uri https://repo.maven.apache.org/maven2/commons-io/commons-io/2.6/commons-io-2.6-sources.jar --slot 1 --keywords "~amd64" --ebuild commons-io-2.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="commons-io:commons-io:2.6"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Apache Commons IO library contains utility classes, stream implementations, file filters,
file comparators, endian transformation classes, and much more."
HOMEPAGE="http://commons.apache.org/proper/commons-io/"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
	https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-test-sources.jar"
LICENSE="Apache-2.0"
SLOT="1"
KEYWORDS="~amd64"
#KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"

DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	test? (
		dev-java/junit:4
		dev-util/japi-compliance-checker
		dev-util/pkgdiff
	)
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=(
	"src/main/resources"
)

JAVA_TESTING_FRAMEWORKS="junit pkgdiff"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=("src/test/java")
JAVA_TEST_GENTOO_CLASSPATH="junit-4"

JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_RM_FILES=(
	"${JAVA_TEST_SRC_DIR}/org/apache/commons/io/comparator/DirectoryFileComparatorTest.java"
)
