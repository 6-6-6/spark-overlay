# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom jakarta.validation-api-3.0.2.pom --download-uri https://repo1.maven.org/maven2/jakarta/validation/jakarta.validation-api/3.0.2/jakarta.validation-api-3.0.2-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-validation-api-3.0.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="jakarta.validation:jakarta.validation-api:3.0.2"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Bean Validation API"
HOMEPAGE="https://beanvalidation.org"
SRC_URI="https://repo1.maven.org/maven2/jakarta/validation/jakarta.validation-api/${PV}/jakarta.validation-api-${PV}-sources.jar -> ${P}-sources.jar"
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
