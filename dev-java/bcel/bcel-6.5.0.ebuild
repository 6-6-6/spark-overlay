# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/bcel-6.5.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/bcel/bcel/6.5.0/bcel-6.5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild bcel-6.5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Commons Bytecode Engineering Library"
HOMEPAGE="https://commons.apache.org/proper/commons-bcel"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.bcel:bcel:6.5.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
