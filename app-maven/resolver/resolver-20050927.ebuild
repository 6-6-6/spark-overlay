# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/resolver-20050927.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/org/apache/xml/internal/resolver/20050927/resolver-20050927-sources.jar --slot 0 --keywords "~amd64" --ebuild resolver-20050927.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/org/apache/xml/internal/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.org.apache.xml.internal:resolver:20050927"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

