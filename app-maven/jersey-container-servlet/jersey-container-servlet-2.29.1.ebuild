# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-container-servlet-2.29.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/jersey/containers/jersey-container-servlet/2.29.1/jersey-container-servlet-2.29.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-container-servlet-2.29.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jersey core Servlet 3.x implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/project/jersey-container-servlet"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/jersey/containers/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/glassfish/jersey/containers/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.containers:jersey-container-servlet:2.29.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.ws.rs:jakarta.ws.rs-api:2.1.6 -> >=java-virtuals/ws-rs-api-2.1:0
# org.glassfish.jersey.containers:jersey-container-servlet-core:2.29.1 -> >=app-maven/jersey-container-servlet-core-2.29.1:0
# org.glassfish.jersey.core:jersey-common:2.29.1 -> >=app-maven/jersey-common-2.29.1:0
# org.glassfish.jersey.core:jersey-server:2.29.1 -> >=app-maven/jersey-server-2.29.1:0

CDEPEND="
	>=app-maven/jersey-common-2.29.1:0
	>=app-maven/jersey-container-servlet-core-2.29.1:0
	>=app-maven/jersey-server-2.29.1:0
	java-virtuals/ws-rs-api:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.servlet:jakarta.servlet-api:4.0.3 -> >=app-maven/jakarta-servlet-api-4.0.3:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=app-maven/jakarta-servlet-api-4.0.3:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="ws-rs-api,jersey-container-servlet-core,jersey-common,jersey-server,ws-rs-api"
JAVA_CLASSPATH_EXTRA="jakarta-servlet-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
