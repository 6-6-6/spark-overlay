# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.activation-1.2.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/sun/activation/javax.activation/1.2.0/javax.activation-1.2.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/sun/activation/javax.activation/1.2.0/javax.activation-1.2.0.jar --slot 0 --keywords "~amd64" --ebuild javax-activation-1.2.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.activation:javax.activation:1.2.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JavaBeans Activation Framework"
HOMEPAGE="http://java.net/all/javax.activation/"
SRC_URI="https://repo1.maven.org/maven2/com/sun/activation/javax.activation/${PV}/javax.activation-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/activation/javax.activation/${PV}/javax.activation-${PV}.jar -> ${P}-bin.jar"
LICENSE="|| ( CDDL GPL-2-with-classpath-exception )"
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

JAVA_ENCODING="iso-8859-1"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
