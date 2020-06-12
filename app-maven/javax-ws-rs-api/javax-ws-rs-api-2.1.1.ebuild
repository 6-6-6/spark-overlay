# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.ws.rs-api-2.1.1.pom --download-uri https://repo.maven.apache.org/maven2/javax/ws/rs/javax.ws.rs-api/2.1.1/javax.ws.rs-api-2.1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-ws-rs-api-2.1.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java API for RESTful Web Services"
HOMEPAGE="https://github.com/eclipse-ee4j/jaxrs-api"
SRC_URI="https://repo.maven.apache.org/maven2/javax/ws/rs/javax.ws.rs-api/${PV}/javax.ws.rs-api-${PV}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.ws.rs:javax.ws.rs-api:2.1.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

