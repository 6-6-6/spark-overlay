# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/activation-1.1.pom --download-uri https://repo1.maven.org/maven2/javax/activation/activation/1.1/activation-1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild activation-1.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JavaBeans Activation Framework (JAF) is a standard extension to the Java platform that lets you take advantage of standard services to: determine the type of an arbitrary piece of data; encapsulate access to it; discover the operations available on it; and instantiate the appropriate bean to perform the operation(s)."
HOMEPAGE="http://java.sun.com/products/javabeans/jaf/index.jsp"
SRC_URI="https://repo1.maven.org/maven2/javax/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/javax/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.activation:activation:1.1"



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

