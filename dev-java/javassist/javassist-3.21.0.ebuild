# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javassist-3.27.0-GA.pom --from-maven-central --download-uri https://repo.maven.apache.org/maven2/org/javassist/javassist/3.27.0-GA/javassist-3.27.0-GA-sources.jar --binjar-uri https://repo.maven.apache.org/maven2/org/javassist/javassist/3.27.0-GA/javassist-3.27.0-GA.jar --slot 3 --keywords "~amd64 ~arm64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~x86-macos" --ebuild javassist-3.27.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.javassist:javassist:3.21.0-GA"
MAVEN_PROVIDES="javassist:javassist:3.21.0-GA"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Javassist (JAVA programming ASSISTant) makes Java bytecode manipulation simple.  It is a class library for editing bytecodes in Java."
HOMEPAGE="http://www.javassist.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/${PN}/${PN}/${PV}-GA/${P}-GA-sources.jar -> ${P}-sources.jar
	https://repo.maven.apache.org/maven2/org/${PN}/${PN}/${PV}-GA/${P}-GA.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0 LGPL-2.1 MPL-1.1"
SLOT="3"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86 ~amd64-linux ~x86-linux"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
