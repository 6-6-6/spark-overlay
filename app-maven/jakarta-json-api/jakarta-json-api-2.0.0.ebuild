# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.json-api-2.0.0-RC2.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/json/jakarta.json-api/2.0.0-RC2/jakarta.json-api-2.0.0-RC2-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-json-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta JSON Processing defines a Java(R) based framework for parsing, generating, transforming, and querying JSON documents."
HOMEPAGE="https://github.com/eclipse-ee4j/jsonp"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/json/jakarta.json-api/${PV}-RC2/jakarta.json-api-${PV}-RC2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.json:jakarta.json-api:2.0.0-RC2"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

