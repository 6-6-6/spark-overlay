# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/snakeyaml-1.26.pom --download-uri https://repo.maven.apache.org/maven2/org/yaml/snakeyaml/1.26/snakeyaml-1.26-sources.jar --slot 0 --keywords "~amd64" --ebuild snakeyaml-1.26.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="YAML 1.1 parser and emitter for Java"
HOMEPAGE="http://www.snakeyaml.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/yaml/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.yaml:snakeyaml:1.26"



DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

