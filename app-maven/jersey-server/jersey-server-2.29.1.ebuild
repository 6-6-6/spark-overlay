# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-server-2.29.1.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/jersey/core/jersey-server/2.29.1/jersey-server-2.29.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-server-2.29.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jersey core server implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/jersey-server"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.core:jersey-server:2.29.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.annotation:jakarta.annotation-api:1.3.5 -> >=app-maven/jakarta-annotation-api-1.3.5:0
# jakarta.validation:jakarta.validation-api:2.0.2 -> >=app-maven/jakarta-validation-api-2.0.2:0
# jakarta.ws.rs:jakarta.ws.rs-api:2.1.6 -> >=app-maven/jakarta-ws-rs-api-2.1.6:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=app-maven/jakarta-inject-2.6.1:0
# org.glassfish.jersey.core:jersey-client:2.29.1 -> >=app-maven/jersey-client-2.29.1:0
# org.glassfish.jersey.core:jersey-common:2.29.1 -> >=app-maven/jersey-common-2.29.1:0
# org.glassfish.jersey.media:jersey-media-jaxb:2.29.1 -> >=app-maven/jersey-media-jaxb-2.29.1:0

CDEPEND="
	>=app-maven/jakarta-annotation-api-1.3.5:0
	>=app-maven/jakarta-inject-2.6.1:0
	>=app-maven/jakarta-validation-api-2.0.2:0
	>=app-maven/jakarta-ws-rs-api-2.1.6:0
	>=app-maven/jersey-client-2.29.1:0
	>=app-maven/jersey-common-2.29.1:0
	>=app-maven/jersey-media-jaxb-2.29.1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:org.osgi.core:6.0.0 -> >=dev-java/osgi-core-6.0.0:6

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/osgi-core-6.0.0:6
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-annotation-api,jakarta-validation-api,jakarta-ws-rs-api,jakarta-inject,jersey-client,jersey-common,jersey-media-jaxb"
JAVA_CLASSPATH_EXTRA="osgi-core-6"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
