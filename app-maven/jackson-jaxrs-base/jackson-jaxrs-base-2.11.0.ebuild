# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-jaxrs-base-2.11.0.pom --download-uri https://repo.maven.apache.org/maven2/com/fasterxml/jackson/jaxrs/jackson-jaxrs-base/2.11.0/jackson-jaxrs-base-2.11.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-jaxrs-base-2.11.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Pile of code that is shared by all Jackson-based JAX-RS
providers."
HOMEPAGE="http://github.com/FasterXML/jackson-jaxrs-providers/jackson-jaxrs-base"
SRC_URI="https://repo.maven.apache.org/maven2/com/fasterxml/jackson/jaxrs/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.fasterxml.jackson.jaxrs:jackson-jaxrs-base:2.11.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.11.0 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.11.0 -> >=dev-java/jackson-databind-2.11.0:0

CDEPEND="
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-databind-2.11.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.ws.rs:javax.ws.rs-api:2.1.1 -> >=app-maven/javax-ws-rs-api-2.1.1:0

DEPEND="
	>=virtual/jdk-1.7:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/javax-ws-rs-api-2.1.1:0
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-2,jackson-databind"
JAVA_GENTOO_CLASSPATH_EXTRA="javax-ws-rs-api"
