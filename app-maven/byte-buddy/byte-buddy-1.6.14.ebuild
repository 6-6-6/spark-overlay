# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/byte-buddy-1.6.14.pom --download-uri https://repo.maven.apache.org/maven2/net/bytebuddy/byte-buddy/1.6.14/byte-buddy-1.6.14-sources.jar --slot 0 --keywords "~amd64" --ebuild byte-buddy-1.6.14.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Byte Buddy is a Java library for creating Java classes at run time.
        This artifact is a build of Byte Buddy with all ASM dependencies repackaged into its own name space."
HOMEPAGE="http://bytebuddy.net/byte-buddy"
SRC_URI="https://repo.maven.apache.org/maven2/net/bytebuddy/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.bytebuddy:byte-buddy:1.6.14"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:annotations:3.0.1u2 -> >=dev-java/findbugs-annotation-3.0.12:3
# org.projectlombok:lombok:1.16.16 -> >=app-maven/lombok-1.16.16:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	>=app-maven/lombok-1.16.16:0
	>=dev-java/findbugs-annotation-3.0.12:3
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="findbugs-annotation-3,lombok"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
