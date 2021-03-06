# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-constants-0.8.7.pom --download-uri https://repo.maven.apache.org/maven2/com/github/jnr/jnr-constants/0.8.7/jnr-constants-0.8.7-sources.jar --slot 0 --keywords "~amd64" --ebuild jnr-constants-0.8.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.github.jnr:jnr-constants:0.8.7"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A set of platform constants (e.g. errno values)"
HOMEPAGE="http://github.com/jnr/jnr-constants"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
