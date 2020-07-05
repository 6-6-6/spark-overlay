# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.servlet-1.0.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/felix/javax.servlet/1.0.0/javax.servlet-1.0.0.jar --slot 0 --keywords "~amd64" --ebuild javax-servlet-1.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Servlet 2.1 API"
HOMEPAGE="http://felix.apache.org/javax.servlet/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/felix/javax.servlet/${PV}/javax.servlet-${PV}.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.felix:javax.servlet:1.0.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.4:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
