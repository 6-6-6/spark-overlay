# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javassist-3.27.0-GA.pom --download-uri https://repo.maven.apache.org/maven2/org/javassist/javassist/3.27.0-GA/javassist-3.27.0-GA-sources.jar --slot 0 --keywords "~amd64" --ebuild javassist-3.27.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Javassist (JAVA programming ASSISTant) makes Java bytecode manipulation simple.  It is a class library for editing bytecodes in Java."
HOMEPAGE="http://www.javassist.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/${PN}/${PN}/${PV}-GA/${P}-GA-sources.jar -> ${P}-sources.jar
		https://repo.maven.apache.org/maven2/org/${PN}/${PN}/${PV}-GA/${P}-GA.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="3"
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-linux ~arm64 ~x86-linux ~x86-macos"
MAVEN_ID="org.javassist:javassist:3.23.0-GA"
MAVEN_PROVIDES="javassist:javassist:3.23.0-GA"

JAVA_NEEDS_TOOLS=1

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
