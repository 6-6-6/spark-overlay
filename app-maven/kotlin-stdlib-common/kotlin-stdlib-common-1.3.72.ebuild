# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kotlin-stdlib-common-1.3.72.pom --download-uri https://repo.maven.apache.org/maven2/org/jetbrains/kotlin/kotlin-stdlib-common/1.3.72/kotlin-stdlib-common-1.3.72-sources.jar --slot 0 --keywords "~amd64" --ebuild kotlin-stdlib-common-1.3.72.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Kotlin Common Standard Library"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jetbrains.kotlin:kotlin-stdlib-common:1.3.72"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

