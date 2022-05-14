# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test"
MAVEN_ID="jakarta.validation:jakarta.validation-api:${PV}"
JAVA_TESTING_FRAMEWORKS="testng"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Bean Validation API"
HOMEPAGE="https://beanvalidation.org/2.0/"
SRC_URI="https://github.com/eclipse-ee4j/beanvalidation-api/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="2.0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/beanvalidation-api-${PV}"

DOCS=( NOTICE.md copyright.txt )

JAVA_SRC_DIR="src/main/java"

JAVA_TEST_GENTOO_CLASSPATH="testng"
JAVA_TEST_SRC_DIR="src/test/java"
JAVA_TEST_RESOURCE_DIRS=( "src/test/resources" )
