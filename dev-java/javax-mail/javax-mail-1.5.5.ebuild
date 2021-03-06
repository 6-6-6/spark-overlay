# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.mail-1.5.5.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/sun/mail/javax.mail/1.5.5/javax.mail-1.5.5-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/sun/mail/javax.mail/1.5.5/javax.mail-1.5.5.jar --slot 0 --keywords "~amd64" --ebuild javax-mail-1.5.5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.mail:javax.mail:1.5.5"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JavaMail API"
HOMEPAGE="http://javamail.java.net/javax.mail"
SRC_URI="https://repo1.maven.org/maven2/com/sun/mail/javax.mail/${PV}/javax.mail-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/mail/javax.mail/${PV}/javax.mail-${PV}.jar -> ${P}-bin.jar"
LICENSE="|| ( CDDL GPL-2-with-classpath-exception )"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/javax.mail-${PV}.pom
# javax.activation:activation:1.1 -> >=dev-java/javax-activation-1.1:0

CDEPEND="
	>=dev-java/javax-activation-1.1:0
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

JAVA_GENTOO_CLASSPATH="javax-activation"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
