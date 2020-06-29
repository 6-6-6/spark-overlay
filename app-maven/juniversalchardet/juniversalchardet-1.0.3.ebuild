# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/juniversalchardet-1.0.3.pom --download-uri https://repo.maven.apache.org/maven2/com/googlecode/juniversalchardet/juniversalchardet/1.0.3/juniversalchardet-1.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild juniversalchardet-1.0.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java port of universalchardet"
HOMEPAGE="http://juniversalchardet.googlecode.com/"
SRC_URI="https://repo.maven.apache.org/maven2/com/googlecode/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.googlecode.juniversalchardet:juniversalchardet:1.0.3"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="us-ascii"

