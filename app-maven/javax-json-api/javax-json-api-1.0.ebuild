# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.json-api-1.0.pom --download-uri https://repo.maven.apache.org/maven2/javax/json/javax.json-api/1.0/javax.json-api-1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-json-api-1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="API module of JSR 353:Java API for Processing JSON"
HOMEPAGE="http://json-processing-spec.java.net"
SRC_URI="https://repo.maven.apache.org/maven2/javax/json/javax.json-api/${PV}/javax.json-api-${PV}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.json:javax.json-api:1.0"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
