# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-client-2.29.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/jersey/core/jersey-client/2.29.1/jersey-client-2.29.1-sources.jar --slot 2 --keywords "~amd64" --ebuild jersey-client-2.29.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jersey core client implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/jersey-client"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="BSD-2 GPL-2-with-classpath-exception MIT W3C public-domain EPL-1.0 CC0 Apache-2.0 BSD EPL-2.0"
SLOT="2"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.core:jersey-client:2.29.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.ws.rs:jakarta.ws.rs-api:2.1.6 -> java-virtuals/ws-rs-api:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=dev-java/jakarta-inject-2.6.1:0
# org.glassfish.jersey.core:jersey-common:2.29.1 -> >=dev-java/jersey-common-2.29.1:2

CDEPEND="
	>=dev-java/jakarta-inject-2.6.1:0
	>=dev-java/jersey-common-2.29.1:2
	java-virtuals/ws-rs-api:0
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

JAVA_GENTOO_CLASSPATH="ws-rs,jakarta-inject,jersey-common-2"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
