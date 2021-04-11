# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.mail-2.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/sun/mail/jakarta.mail/2.0.0/jakarta.mail-2.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/sun/mail/jakarta.mail/2.0.0/jakarta.mail-2.0.0.jar --slot 0 --keywords "~amd64" --ebuild jakarta-mail-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.mail:jakarta.mail:2.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jakarta Mail API"
HOMEPAGE="http://eclipse-ee4j.github.io/mail/jakarta.mail"
SRC_URI="https://repo1.maven.org/maven2/com/sun/mail/jakarta.mail/${PV}/jakarta.mail-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/mail/jakarta.mail/${PV}/jakarta.mail-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 EPL-2.0 GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.mail-${PV}.pom
# com.sun.activation:jakarta.activation:2.0.0 -> >=dev-java/jakarta-activation-2.0.0:0

CDEPEND="
	>=dev-java/jakarta-activation-2.0.0:0
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

JAVA_ENCODING="iso-8859-1"

JAVA_GENTOO_CLASSPATH="jakarta-activation"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
