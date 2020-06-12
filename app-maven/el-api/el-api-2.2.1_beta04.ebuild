# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/el-api-2.2.1-b04.pom --download-uri https://repo.maven.apache.org/maven2/javax/el/el-api/2.2.1-b04/el-api-2.2.1-b04-sources.jar --slot 0 --keywords "~amd64" --ebuild el-api-2.2.1_beta04.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/javax/el/${PN}/2.2.1-b04/${PN}-2.2.1-b04-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.el:el-api:2.2.1-b04"



DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
"

S="${WORKDIR}"

