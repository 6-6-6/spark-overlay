# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/annotations-13.0.pom --download-uri https://repo.maven.apache.org/maven2/org/jetbrains/annotations/13.0/annotations-13.0-sources.jar --slot 0 --keywords "~amd64" --ebuild annotations-13.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="annotations"
MY_P=${MY_PN}-${PV}

DESCRIPTION="A set of annotations used for code inspection support and code documentation."
HOMEPAGE="http://www.jetbrains.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/jetbrains/${MY_PN}/${PV}/${MY_P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jetbrains:annotations:13.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
