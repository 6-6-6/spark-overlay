# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/maven-model-2.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/maven/maven-model/2.2.1/maven-model-2.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild maven-model-2.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Maven Model"
HOMEPAGE="http://maven.apache.org/maven-model"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/maven/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.maven:maven-model:2.2.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.plexus:plexus-utils:1.5.15 -> >=app-maven/plexus-utils-1.5.15:0

CDEPEND="
	>=app-maven/plexus-utils-1.5.15:0
"


DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="plexus-utils"
