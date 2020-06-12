# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.jws-api-3.0.0-RC2.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/jws/jakarta.jws-api/3.0.0-RC2/jakarta.jws-api-3.0.0-RC2-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-jws-api-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Web Services Metadata API"
HOMEPAGE="https://github.com/eclipse-ee4j/jws-api"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/jws/jakarta.jws-api/${PV}-RC2/jakarta.jws-api-${PV}-RC2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.jws:jakarta.jws-api:3.0.0-RC2"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

