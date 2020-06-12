# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-client-3.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/jersey/core/jersey-client/3.0.0-M1/jersey-client-3.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-client-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jersey core client implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/jersey-client"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/jersey/core/${PN}/${PV}-M1/${P}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.core:jersey-client:3.0.0-M1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M1.pom
# jakarta.ws.rs:jakarta.ws.rs-api:3.0.0-M1 -> >=app-maven/jakarta-ws-rs-api-3.0.0:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=app-maven/jakarta-inject-2.6.1:0
# org.glassfish.jersey.core:jersey-common:3.0.0-M1 -> >=app-maven/jersey-common-3.0.0:0

CDEPEND="
	>=app-maven/jakarta-inject-2.6.1:0
	>=app-maven/jakarta-ws-rs-api-3.0.0:0
	>=app-maven/jersey-common-3.0.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-ws-rs-api,jakarta-inject,jersey-common"
