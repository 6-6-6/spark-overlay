# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/minlog-1.3.1.pom --download-uri https://repo.maven.apache.org/maven2/com/esotericsoftware/minlog/1.3.1/minlog-1.3.1-sources.jar --slot 0 --keywords "~amd64" --ebuild minlog-1.3.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Minimal overhead Java logging"
HOMEPAGE="https://github.com/EsotericSoftware/minlog"
SRC_URI="https://repo.maven.apache.org/maven2/com/esotericsoftware/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.esotericsoftware:minlog:1.3.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

