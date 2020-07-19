# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-pkg-simple

MY_P=${P}-src
DESCRIPTION="Utility classes, stream implementations, file filters, and endian classes"
HOMEPAGE="http://commons.apache.org/io/"
SRC_URI="mirror://apache/commons/io/source/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"

RDEPEND=">=virtual/jre-1.8"
DEPEND=">=virtual/jdk-1.8
	test? (
		dev-java/ant-junit:0
		dev-java/junit:4
	)"

S=${WORKDIR}/${MY_P}

JAVA_SRC_DIR="src/main/java/"

JAVA_TESTING_FRAMEWORK="junit"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=("src/test/resources")
JAVA_GENTOO_TEST_CLASSPATH="junit-4"
