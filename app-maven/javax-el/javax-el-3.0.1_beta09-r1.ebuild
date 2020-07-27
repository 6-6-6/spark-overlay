# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.el-3.0.1-b09.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/javax.el/3.0.1-b09/javax.el-3.0.1-b09-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-el-3.0.1_beta09-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java.net - The Source for Java Technology Collaboration"
HOMEPAGE="http://uel.java.net"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/javax.el/3.0.1-b09/javax.el-3.0.1-b09-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/javax.el/3.0.1-b09/javax.el-3.0.1-b09.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish:javax.el:3.0.1-b09"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip -q "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
