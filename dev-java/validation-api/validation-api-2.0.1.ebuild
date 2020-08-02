# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/validation-api-2.0.1.Final.pom --download-uri https://repo.maven.apache.org/maven2/javax/validation/validation-api/2.0.1.Final/validation-api-2.0.1.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild validation-api-2.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Bean Validation API"
HOMEPAGE="http://beanvalidation.org"
SRC_URI="https://repo.maven.apache.org/maven2/javax/validation/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
MAVEN_ID="javax.validation:validation-api:2.0.1.Final"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
