# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom jakarta.json.bind-api-3.0.1.pom --download-uri https://repo1.maven.org/maven2/jakarta/json/bind/jakarta.json.bind-api/3.0.1/jakarta.json.bind-api-3.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-json-bind-api-3.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="jakarta.json.bind:jakarta.json.bind-api:3.0.1"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta JSON Binding is a standard binding layer for converting Java objects to/from JSON documents."
HOMEPAGE="https://jakartaee.github.io/jsonb-api"
SRC_URI="https://repo1.maven.org/maven2/jakarta/json/bind/jakarta.json.bind-api/${PV}/jakarta.json.bind-api-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE="EPL-2.0 GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	dev-java/jakarta-json-api:2
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-json-api-2"
JAVA_SRC_DIR="jakarta"
