# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/openjsse-1.1.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/openjsse/openjsse/1.1.0/openjsse-1.1.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/openjsse/openjsse/1.1.0/openjsse-1.1.0.jar --slot 0 --keywords "~amd64" --ebuild openjsse-1.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.openjsse:openjsse:1.1.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="OpenJSSE delivers a TLS 1.3 JSSE provider for Java SE 8"
HOMEPAGE="https://github.com/openjsse/openjsse"
SRC_URI="
	https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="GPL-2-with-classpath-exception BSD-2"
KEYWORDS="~amd64"
# Version 1.1.7 is not compatible with 1.1.0 according to JAPICC
SLOT="1.1.0"

# Building the package requires some sun.* Java packages, like
# sun.security.util, which could not be found anywhere
IUSE="+binary"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
