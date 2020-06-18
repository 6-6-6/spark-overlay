# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jna-5.5.0.pom --download-uri https://repo.maven.apache.org/maven2/net/java/dev/jna/jna/5.5.0/jna-5.5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jna-5.5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java Native Access"
HOMEPAGE="https://github.com/java-native-access/jna"
SRC_URI="https://repo.maven.apache.org/maven2/net/java/dev/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="5"
KEYWORDS="~amd64"
MAVEN_ID="net.java.dev.jna:jna:5.5.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

