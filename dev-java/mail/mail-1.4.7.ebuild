# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/mail-1.4.7.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/javax/mail/mail/1.4.7/mail-1.4.7-sources.jar --binjar-uri https://repo1.maven.org/maven2/javax/mail/mail/1.4.7/mail-1.4.7.jar --slot 0 --keywords "~amd64" --ebuild mail-1.4.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.mail:mail:1.4.7"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JavaMail API (compat)"
HOMEPAGE="http://kenai.com/projects/javamail/mail"
SRC_URI="https://repo1.maven.org/maven2/javax/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="!!!equivalentPortageLicenseName-not-found!!!"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.activation:activation:1.1 -> >=dev-java/javax-activation-1.1.1:0

CDEPEND="
	>=dev-java/javax-activation-1.1.1:0
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
