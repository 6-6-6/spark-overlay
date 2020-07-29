# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/mail-1.4.pom --download-uri https://repo1.maven.org/maven2/javax/mail/mail/1.4/mail-1.4-sources.jar --slot 0 --keywords "~amd64" --ebuild mail-1.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The JavaMail API provides a platform-independent and protocol-independent framework to build mail and messaging applications."
HOMEPAGE="https://glassfish.dev.java.net/javaee5/mail/"
SRC_URI="https://repo1.maven.org/maven2/javax/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/javax/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.mail:mail:1.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.activation:activation:1.1 -> >=dev-java/activation-1.1:0

CDEPEND="
	>=dev-java/activation-1.1:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="activation"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

