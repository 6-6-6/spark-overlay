# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-ffi-2.0.3.pom --download-uri https://repo.maven.apache.org/maven2/com/github/jnr/jnr-ffi/2.0.3/jnr-ffi-2.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild jnr-ffi-2.0.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.github.jnr:jnr-ffi:2.0.3"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A library for invoking native functions from java"
HOMEPAGE="http://github.com/jnr/jnr-ffi"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar
		https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jffi:1.2.9 -> >=dev-java/jffi-1.2.9:1.2
# com.github.jnr:jnr-x86asm:1.0.2 -> >=dev-java/jnr-x86asm-1.0.2:1.0
# org.ow2.asm:asm:5.0.3 -> >=dev-java/asm-5.0.3:4

CDEPEND="
	>=dev-java/asm-5.0.3:4
	>=dev-java/jffi-1.2.9:1.2
	>=dev-java/jnr-x86asm-1.0.2:1.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jffi:1.2.9 -> >=dev-java/jffi-1.2.9:1.2
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=dev-java/jffi-1.2.9:1.2
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jffi-1.2,jnr-x86asm-1.0,asm-4,jffi-1.2"
JAVA_SRC_DIR="src/main/java"

JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
