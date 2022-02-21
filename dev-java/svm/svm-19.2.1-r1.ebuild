# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/svm-19.2.1.pom --download-uri https://repo.maven.apache.org/maven2/com/oracle/substratevm/svm/19.2.1/svm-19.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild svm-19.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"
MAVEN_ID="com.oracle.substratevm:svm:19.2.1"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="SubstrateVM image builder components"
HOMEPAGE="https://github.com/oracle/graal/tree/master/substratevm"
SRC_URI="https://repo.maven.apache.org/maven2/com/oracle/substratevm/${PN}/${PV}/${P}-sources.jar
	https://repo.maven.apache.org/maven2/com/oracle/substratevm/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

# Cannot find some symbols under org.graalvm.{compiler,nativeimage}.*
IUSE="+binary"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.oracle.substratevm:objectfile:19.2.1 -> !!!artifactId-not-found!!!
# com.oracle.substratevm:pointsto:19.2.1 -> !!!artifactId-not-found!!!
# org.graalvm.sdk:graal-sdk:19.2.1 -> !!!artifactId-not-found!!!
# org.graalvm.compiler:compiler:19.2.1 -> >=dev-java/graalvm-compiler-19.2.1
# org.graalvm.truffle:truffle-nfi:19.2.1 -> dev-java/truffle-nfi:19

CDEPEND="
	>=dev-java/objectfile-19.2.1
	>=dev-java/pointsto-19.2.1
	>=dev-java/graal-sdk-19.2.1
	>=dev-java/graalvm-compiler-19.2.1
	dev-java/truffle-nfi
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="truffle-nfi,objectfile,pointsto,graal-sdk,graalvm-compiler"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
