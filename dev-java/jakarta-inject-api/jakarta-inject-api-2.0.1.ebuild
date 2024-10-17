# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom jakarta.inject-api-2.0.1.pom --download-uri https://repo1.maven.org/maven2/jakarta/inject/jakarta.inject-api/2.0.1/jakarta.inject-api-2.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-inject-api-2.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="jakarta.inject:jakarta.inject-api:2.0.1"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Dependency Injection"
HOMEPAGE="https://github.com/eclipse-ee4j/injection-api"
SRC_URI="https://repo1.maven.org/maven2/jakarta/inject/jakarta.inject-api/${PV}/jakarta.inject-api-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE="Apache-2.0"
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

JAVA_SRC_DIR="jakarta"
JAVA_RESOURCE_DIRS=(
	""
)
