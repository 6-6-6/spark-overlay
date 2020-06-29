# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/chill-java-0.9.3.pom --download-uri https://repo.maven.apache.org/maven2/com/twitter/chill-java/0.9.3/chill-java-0.9.3-sources.jar --slot 0 --keywords "~amd64" --ebuild chill-java-0.9.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="chill-java"
HOMEPAGE="https://github.com/twitter/chill"
SRC_URI="https://repo.maven.apache.org/maven2/com/twitter/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.twitter:chill-java:0.9.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.esotericsoftware:kryo-shaded:4.0.2 -> >=app-maven/kryo-shaded-4.0.2:0

CDEPEND="
	>=app-maven/kryo-shaded-4.0.2:0
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

JAVA_GENTOO_CLASSPATH="kryo-shaded"
