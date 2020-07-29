# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-media-sse-2.29.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/jersey/media/jersey-media-sse/2.29.1/jersey-media-sse-2.29.1-sources.jar --slot 2 --keywords "~amd64" --ebuild jersey-media-sse-2.29.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jersey Server Sent Events entity providers support module."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/project/jersey-media-sse"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/jersey/media/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/jersey/media/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="2"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.media:jersey-media-sse:2.29.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=dev-java/jakarta-inject-2.6.1:0
# org.glassfish.jersey.core:jersey-server:2.29.1 -> >=dev-java/jersey-server-2.29.1:2

CDEPEND="
	>=dev-java/jakarta-inject-2.6.1:0
	>=dev-java/jersey-server-2.29.1:2
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-inject,jersey-server-2"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

