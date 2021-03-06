# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/activation-1.1.1.pom --download-uri https://repo1.maven.org/maven2/javax/activation/activation/1.1.1/activation-1.1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild activation-1.1.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.activation:activation:1.1.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="activation"
MY_P=${MY_PN}-${PV}
DESCRIPTION="The JavaBeans(TM) Activation Framework is used by the JavaMail(TM) API to manage MIME data"
HOMEPAGE="http://java.sun.com/javase/technologies/desktop/javabeans/jaf/index.jsp"
SRC_URI="https://repo1.maven.org/maven2/javax/${MY_PN}/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-souorces.jar
	https://repo1.maven.org/maven2/javax/${MY_PN}/${MY_PN}/${PV}/${MY_P}.jar -> ${P}-bin.jar"
LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
