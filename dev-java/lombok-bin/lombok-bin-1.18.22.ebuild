# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="org.projectlombok:lombok:${PV}"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN%-bin}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Binary package for Project Lombok"
HOMEPAGE="https://projectlombok.org/"
SRC_URI="https://repo1.maven.org/maven2/org/projectlombok/${MY_PN}/${PV}/${MY_P}.jar -> ${MY_P}-bin.jar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=virtual/jre-1.8:*
"

src_unpack() {
	: # Binary package, no source to unpack or compile
}

src_compile() {
	cp "${DISTDIR}/${MY_P}-bin.jar" "${JAVA_JAR_FILENAME}" ||
		die "Failed to copy JAR to JAVA_JAR_FILENAME"
}

src_install() {
	java-pkg_jarinto "/opt/${PN}/lib"
	java-pkg-simple_src_install
}
