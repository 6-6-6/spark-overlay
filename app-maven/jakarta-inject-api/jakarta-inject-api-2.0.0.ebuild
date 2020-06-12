# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.inject-api-2.0.0-RC4.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/inject/jakarta.inject-api/2.0.0-RC4/jakarta.inject-api-2.0.0-RC4-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-inject-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Dependency Injection"
HOMEPAGE="https://github.com/eclipse-ee4j/injection-api"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/inject/jakarta.inject-api/${PV}-RC4/jakarta.inject-api-${PV}-RC4-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.inject:jakarta.inject-api:2.0.0-RC4"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

