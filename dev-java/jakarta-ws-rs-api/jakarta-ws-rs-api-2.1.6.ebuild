# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.ws.rs-api-2.1.6.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/ws/rs/jakarta.ws.rs-api/2.1.6/jakarta.ws.rs-api-2.1.6-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-ws-rs-api-2.1.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="VIRTUAL:PROVIDED:0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jakarta RESTful Web Services API"
HOMEPAGE="https://github.com/eclipse-ee4j/jaxrs-api"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/ws/rs/jakarta.ws.rs-api/${PV}/jakarta.ws.rs-api-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE="GPL-2-with-classpath-exception EPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

JAVA_RM_FILES=(
	"${JAVA_SRC_DIR}/module-info.java"
)
