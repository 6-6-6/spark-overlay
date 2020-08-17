# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.json-1.0.4.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/javax.json/1.0.4/javax.json-1.0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-json-1.0.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.glassfish:javax.json:1.0.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Default provider for JSR 353:Java API for Processing JSON"
HOMEPAGE="http://jsonp.java.net"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/javax.json/${PV}/javax.json-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/javax.json/${PV}/javax.json-${PV}.jar -> ${P}-bin.jar"
LICENSE="CDDL-1.1 GPL-2"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/javax.json-${PV}.pom
# javax.json:javax.json-api:1.0 -> >=dev-java/javax-json-api-1.0:0

CDEPEND="
	>=dev-java/javax-json-api-1.0:0
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

JAVA_GENTOO_CLASSPATH="javax-json-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
