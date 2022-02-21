# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/compiler-19.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/graalvm/compiler/compiler/19.2.1/compiler-19.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild graalvm-compiler-19.2.1-r2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="org.graalvm.compiler:compiler:19.2.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The GraalVM compiler and the Graal-truffle optimizer."
HOMEPAGE="https://www.graalvm.org/"
SRC_URI="
	https://repo.maven.apache.org/maven2/org/graalvm/compiler/compiler/${PV}/compiler-${PV}-sources.jar -> ${P}-sources.jar
	https://repo.maven.apache.org/maven2/org/graalvm/compiler/compiler/${PV}/compiler-${PV}.jar -> ${P}-bin.jar
"
LICENSE="GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

# This package import classes that do not exist from jdk.vm.ci Java package
IUSE="+binary"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/compiler-${PV}.pom
# org.graalvm.sdk:graal-sdk:19.2.1 -> >=dev-java/graal-sdk-19.2.1:0
# org.graalvm.truffle:truffle-api:19.2.1 -> >=dev-java/truffle-api-20.1.0:0

CDEPEND="
	>=dev-java/graal-sdk-19.2.1:0
	>=dev-java/truffle-api-20.1.0:0
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

JAVA_GENTOO_CLASSPATH="graal-sdk,truffle-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
