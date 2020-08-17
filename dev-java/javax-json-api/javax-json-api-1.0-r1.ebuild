# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.json-api-1.0.pom --download-uri https://repo1.maven.org/maven2/javax/json/javax.json-api/1.0/javax.json-api-1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-json-api-1.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.json:javax.json-api:1.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="API module of JSR 353:Java API for Processing JSON"
HOMEPAGE="http://json-processing-spec.java.net"
SRC_URI="https://repo1.maven.org/maven2/javax/json/javax.json-api/${PV}/javax.json-api-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/javax/json/javax.json-api/${PV}/javax.json-api-${PV}.jar -> ${P}-bin.jar"
LICENSE="CDDL-1.1 GPL-2"
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
