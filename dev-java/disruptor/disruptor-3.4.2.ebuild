# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/disruptor-3.3.2.pom --download-uri https://repo.maven.apache.org/maven2/com/lmax/disruptor/3.3.2/disruptor-3.3.2-sources.jar --slot 0 --keywords "~amd64" --ebuild disruptor-3.3.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Disruptor - Concurrent Programming Framework"
HOMEPAGE="http://lmax-exchange.github.com/disruptor"
SRC_URI="https://repo.maven.apache.org/maven2/com/lmax/${PN}/${PV}/${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
MAVEN_ID="com.lmax:disruptor:3.4.2"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

