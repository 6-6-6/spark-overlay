# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/byte-buddy-1.6.14.pom --download-uri https://repo1.maven.org/maven2/net/bytebuddy/byte-buddy/1.6.14/byte-buddy-1.6.14-sources.jar --slot 0 --keywords "~amd64" --ebuild byte-buddy-1.6.14-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.bytebuddy:byte-buddy:1.6.14"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Byte Buddy is a Java library for creating Java classes at run time.
        This artifact is a build of Byte Buddy with all ASM dependencies repackaged into its own name space."
HOMEPAGE="http://bytebuddy.net/byte-buddy"
SRC_URI="https://repo1.maven.org/maven2/net/bytebuddy/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/net/bytebuddy/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:annotations:3.0.1u2 -> >=dev-java/findbugs-annotations-3.0.12:3
# org.projectlombok:lombok:1.16.16 -> >=dev-java/lombok-1.16.16:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	>=dev-java/lombok-1.16.16:0
	>=dev-java/findbugs-annotations-3.0.12:3
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="findbugs-annotations-3,lombok"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
