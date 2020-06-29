# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/nekohtml-1.9.6.2.pom --download-uri https://repo.maven.apache.org/maven2/nekohtml/nekohtml/1.9.6.2/nekohtml-1.9.6.2-sources.jar --slot 0 --keywords "~amd64" --ebuild nekohtml-1.9.6.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE="http://nekohtml.sourceforge.net/"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="nekohtml:nekohtml:1.9.6.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# xerces:xercesImpl:2.8.1 -> >=dev-java/xerces-2.12.0:2

CDEPEND="
	>=dev-java/xerces-2.12.0:2
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="xerces-2"
