# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/pointsto-19.2.1.pom --download-uri https://repo1.maven.org/maven2/com/oracle/substratevm/pointsto/19.2.1/pointsto-19.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild pointsto-19.2.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.oracle.substratevm:pointsto:19.2.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="SubstrateVM static analysis to find ahead-of-time the code"
HOMEPAGE="https://github.com/oracle/graal/tree/master/substratevm"
SRC_URI="https://repo1.maven.org/maven2/com/oracle/substratevm/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/oracle/substratevm/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

# This package requires many classes within the jdk.vm.ci package, which is not
# available in Java 8; even with Java 11, with provides those classes, there
# are still compiler errors due to incompatible API changes
IUSE="+binary"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.graalvm.compiler:compiler:19.2.1 -> >=dev-java/graalvm-compiler-19.2.1:0

CDEPEND="
	>=dev-java/graalvm-compiler-19.2.1:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="graalvm-compiler"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
