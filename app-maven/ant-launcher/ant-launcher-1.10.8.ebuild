# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/ant-launcher-1.10.8.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/ant/ant-launcher/1.10.8/ant-launcher-1.10.8-sources.jar --slot 0 --keywords "~amd64" --ebuild ant-launcher-1.10.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="master POM"
HOMEPAGE="https://ant.apache.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/ant/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.ant:ant-launcher:1.10.8"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

