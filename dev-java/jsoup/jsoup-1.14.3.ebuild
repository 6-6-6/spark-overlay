# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.jsoup:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java HTML parser that makes sense of real-world HTML soup"
HOMEPAGE="https://jsoup.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux"

CP_DEPEND="
	dev-java/jsr305:0
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
