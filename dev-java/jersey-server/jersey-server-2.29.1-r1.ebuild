# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-server-2.29.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/jersey/core/jersey-server/2.29.1/jersey-server-2.29.1-sources.jar --slot 2 --keywords "~amd64" --ebuild jersey-server-2.29.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jersey core server implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/jersey-server"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/jersey/core/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="GPL-2-with-classpath-exception EPL-2.0 Apache-2.0 BSD"
SLOT="2"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.core:jersey-server:2.29.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.annotation:jakarta.annotation-api:1.3.5 -> >=dev-java/jakarta-annotation-api-1.3.5:0
# jakarta.validation:jakarta.validation-api:2.0.2 -> >=dev-java/jakarta-validation-api-2.0.2:0
# jakarta.ws.rs:jakarta.ws.rs-api:2.1.6 -> java-virtuals/ws-rs-api:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=dev-java/jakarta-inject-2.6.1:0
# org.glassfish.jersey.core:jersey-client:2.29.1 -> >=dev-java/jersey-client-2.29.1:2
# org.glassfish.jersey.core:jersey-common:2.29.1 -> >=dev-java/jersey-common-2.29.1:2
# org.glassfish.jersey.media:jersey-media-jaxb:2.29.1 -> >=dev-java/jersey-media-jaxb-2.29.1:2

CDEPEND="
	>=dev-java/jakarta-annotation-api-1.3.5:0
	>=dev-java/jakarta-inject-2.6.1:0
	>=dev-java/jakarta-validation-api-2.0.2:0
	>=dev-java/jersey-client-2.29.1:2
	>=dev-java/jersey-common-2.29.1:2
	>=dev-java/jersey-media-jaxb-2.29.1:2
	java-virtuals/ws-rs-api:0
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

JAVA_GENTOO_CLASSPATH="jakarta-annotation-api,jakarta-validation-api,ws-rs,jakarta-inject,jersey-client-2,jersey-common-2,jersey-media-jaxb-2"
JAVA_CLASSPATH_EXTRA="osgi-core-6"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

