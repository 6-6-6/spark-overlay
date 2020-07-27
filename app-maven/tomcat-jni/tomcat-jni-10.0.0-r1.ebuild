# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/tomcat-jni-10.0.0-M7.pom --download-uri https://repo1.maven.org/maven2/org/apache/tomcat/tomcat-jni/10.0.0-M7/tomcat-jni-10.0.0-M7-sources.jar --slot 0 --keywords "~amd64" --ebuild tomcat-jni-10.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Interface code to the native connector"
HOMEPAGE="https://tomcat.apache.org/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/tomcat/${PN}/${PV}-M7/${P}-M7-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/tomcat/${PN}/${PV}-M7/${P}-M7.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.tomcat:tomcat-jni:10.0.0-M7"



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

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
