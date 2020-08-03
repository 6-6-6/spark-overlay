# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-media-jaxb-2.29.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/jersey/media/jersey-media-jaxb/2.29.1/jersey-media-jaxb-2.29.1-sources.jar --slot 2 --keywords "~amd64" --ebuild jersey-media-jaxb-2.29.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.glassfish.jersey.media:jersey-media-jaxb:2.29.1"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JAX-RS features based upon JAX-B."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/project/jersey-media-jaxb"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/jersey/media/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/jersey/media/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="EPL-2.0 CC0-1.0 MIT EPL-1.0 Apache-2.0 GPL-2-with-classpath-exception BSD-2 public-domain BSD W3C"
SLOT="2"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.glassfish.hk2:osgi-resource-locator:1.0.3 -> >=dev-java/osgi-resource-locator-1.0.3:0
# org.glassfish.hk2.external:jakarta.inject:2.6.1 -> >=dev-java/jakarta-inject-2.6.1:0
# org.glassfish.jersey.core:jersey-common:2.29.1 -> >=dev-java/jersey-common-2.29.1:2

CDEPEND="
	>=dev-java/jakarta-inject-2.6.1:0
	>=dev-java/jersey-common-2.29.1:2
	>=dev-java/osgi-resource-locator-1.0.3:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jakarta.xml.bind:jakarta.xml.bind-api:2.3.2 -> >=dev-java/jakarta-xml-bind-api-3.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/jakarta-xml-bind-api-3.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="osgi-resource-locator,jakarta-inject,jersey-common-2"
JAVA_CLASSPATH_EXTRA="jakarta-xml-bind-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
