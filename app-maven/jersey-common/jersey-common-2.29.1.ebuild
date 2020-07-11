# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-common-2.29.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/jersey/core/jersey-common/2.29.1/jersey-common-2.29.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-common-2.29.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jersey core common packages"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/jersey-common"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
	https://repo1.maven.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.core:jersey-common:2.29.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.annotation:jakarta.annotation-api:1.3.5 -> >=app-maven/jakarta-annotation-api-1.3.5:0
# jakarta.ws.rs:jakarta.ws.rs-api:2.1.6 -> >=java-virtuals/ws-rs-api-2.1:0
# org.glassfish.hk2:osgi-resource-locator:1.0.3 -> >=app-maven/osgi-resource-locator-1.0.3:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=app-maven/jakarta-inject-2.6.1:0

CDEPEND="
	>=app-maven/jakarta-annotation-api-1.3.5:0
	>=app-maven/jakarta-inject-2.6.1:0
	>=app-maven/osgi-resource-locator-1.0.3:0
	java-virtuals/ws-rs-api
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:org.osgi.core:6.0.0 -> >=dev-java/osgi-core-6.0.0:6

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/osgi-core-6.0.0:6
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-annotation-api,ws-rs-api,osgi-resource-locator,jakarta-inject"
JAVA_CLASSPATH_EXTRA="osgi-core-6"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR} || die
	use binary && ( cp ${DISTDIR}/${P}-bin.jar ${S}/${PN}.jar || die "failed to copy binary jar" )
}
