# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/dirgra-0.3.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/dirgra/0.3/dirgra-0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild dirgra-0.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Simple Directed Graph"
HOMEPAGE="https://github.com/jruby/dirgra"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby:dirgra:0.3"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

