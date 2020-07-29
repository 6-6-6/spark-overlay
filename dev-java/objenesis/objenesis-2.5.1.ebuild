# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/objenesis-2.5.1.pom --download-uri https://repo.maven.apache.org/maven2/org/objenesis/objenesis/2.5.1/objenesis-2.5.1-sources.jar --slot 0 --keywords "~amd64" --ebuild objenesis-2.5.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A library for instantiating Java objects"
HOMEPAGE="http://objenesis.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86 ~arm64"
MAVEN_ID="org.objenesis:objenesis:2.5.1"



DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
