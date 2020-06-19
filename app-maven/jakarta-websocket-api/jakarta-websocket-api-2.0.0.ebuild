# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.websocket-api-2.0.0-RC1.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/websocket/jakarta.websocket-api/2.0.0-RC1/jakarta.websocket-api-2.0.0-RC1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-websocket-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta WebSocket - Server API"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.websocket"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/websocket/jakarta.websocket-api/${PV}-RC1/jakarta.websocket-api-${PV}-RC1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.websocket:jakarta.websocket-api:2.0.0-RC1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.websocket-api-${PV}-RC1.pom
# jakarta.websocket:jakarta.websocket-client-api:2.0.0-RC1 -> >=app-maven/jakarta-websocket-client-api-2.0.0:0

CDEPEND="
	>=app-maven/jakarta-websocket-client-api-2.0.0:0
"


DEPEND="
	>=virtual/jdk-8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-websocket-client-api"
