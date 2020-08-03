# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/minlog-1.3.0.pom --download-uri https://repo.maven.apache.org/maven2/com/esotericsoftware/minlog/1.3.0/minlog-1.3.0-sources.jar --slot 0 --keywords "~amd64" --ebuild minlog-1.3.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.esotericsoftware:minlog:1.3.1"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Minimal overhead Java logging"
HOMEPAGE="https://github.com/EsotericSoftware/minlog"
SRC_URI="https://repo.maven.apache.org/maven2/com/esotericsoftware/${PN}/${PV}/${P}-sources.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
