# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.ws.rs-api-3.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/jakarta/ws/rs/jakarta.ws.rs-api/3.0.0/jakarta.ws.rs-api-3.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/jakarta/ws/rs/jakarta.ws.rs-api/3.0.0/jakarta.ws.rs-api-3.0.0.jar --slot 0 --keywords "~amd64" --ebuild jakarta-ws-rs-api-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="jakarta.ws.rs:jakarta.ws.rs-api:3.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jakarta RESTful Web Services"
HOMEPAGE="https://github.com/eclipse-ee4j/jaxrs-api"
SRC_URI="https://repo1.maven.org/maven2/jakarta/ws/rs/jakarta.ws.rs-api/${PV}/jakarta.ws.rs-api-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/jakarta/ws/rs/jakarta.ws.rs-api/${PV}/jakarta.ws.rs-api-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-2.0 GPL-2-with-classpath-exception"
SLOT="3"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.ws.rs-api-${PV}.pom
# jakarta.activation:jakarta.activation-api:2.0.0 -> >=dev-java/jakarta-activation-api-2.0.0:0
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0 -> >=dev-java/jakarta-xml-bind-api-3.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/jakarta-activation-api-2.0.0:0
		>=dev-java/jakarta-xml-bind-api-3.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-activation-api,jakarta-xml-bind-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
