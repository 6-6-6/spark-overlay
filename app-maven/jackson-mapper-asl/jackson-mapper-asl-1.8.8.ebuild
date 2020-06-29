# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jackson-mapper-asl-1.8.8.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/jackson/jackson-mapper-asl/1.8.8/jackson-mapper-asl-1.8.8-sources.jar --slot 0 --keywords "~amd64" --ebuild jackson-mapper-asl-1.8.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Data Mapper package is a high-performance data binding package
built on Jackson JSON processor"
HOMEPAGE="http://jackson.codehaus.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/jackson/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.jackson:jackson-mapper-asl:1.8.8"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.jackson:jackson-core-asl:1.8.8 -> >=app-maven/jackson-core-asl-1.8.8:0

CDEPEND="
	>=app-maven/jackson-core-asl-1.8.8:0
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

JAVA_GENTOO_CLASSPATH="jackson-core-asl"
