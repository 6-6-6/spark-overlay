# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/mailapi-1.6.3.pom --download-uri https://repo1.maven.org/maven2/com/sun/mail/mailapi/1.6.3/mailapi-1.6.3-sources.jar --slot 0 --keywords "~amd64" --ebuild mailapi-1.6.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JavaMail API (no providers)"
HOMEPAGE="http://eclipse-ee4j.github.io/javamail/mailapi"
SRC_URI="https://repo1.maven.org/maven2/com/sun/mail/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/mail/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="EPL-2.0 EPL-1.0 GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.mail:mailapi:1.6.3"

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

JAVA_RM_FILES=(
	${JAVA_SRC_DIR}/module-info.java
)
