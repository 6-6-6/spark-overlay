# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.ws.rs-api-3.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/ws/rs/jakarta.ws.rs-api/3.0.0-M1/jakarta.ws.rs-api-3.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-ws-rs-api-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta RESTful Web Services"
HOMEPAGE="https://github.com/eclipse-ee4j/jaxrs-api"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/ws/rs/jakarta.ws.rs-api/${PV}-M1/jakarta.ws.rs-api-${PV}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.ws.rs:jakarta.ws.rs-api:3.0.0-M1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.ws.rs-api-${PV}-M1.pom
# jakarta.activation:jakarta.activation-api:2.0.0-rc1 -> >=app-maven/jakarta-activation-api-2.0.0:0
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0-RC1 -> >=app-maven/jakarta-xml-bind-api-3.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/jakarta-activation-api-2.0.0:0
	>=app-maven/jakarta-xml-bind-api-3.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH_EXTRA="jakarta-activation-api,jakarta-xml-bind-api"
