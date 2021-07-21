# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.activation:jakarta.activation:2.0.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jakarta Activation"
HOMEPAGE="https://github.com/eclipse-ee4j/jaf/jakarta.activation"
SRC_URI="https://repo1.maven.org/maven2/com/sun/activation/jakarta.activation/${PV}/jakarta.activation-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/activation/jakarta.activation/${PV}/jakarta.activation-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_RM_FILES=(
	${JAVA_SRC_DIR}/module-info.java
)
