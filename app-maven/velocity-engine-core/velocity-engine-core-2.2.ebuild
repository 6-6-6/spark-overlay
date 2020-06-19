# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/velocity-engine-core-2.2.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/velocity/velocity-engine-core/2.2/velocity-engine-core-2.2-sources.jar --slot 0 --keywords "~amd64" --ebuild velocity-engine-core-2.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Velocity is a general purpose template engine."
HOMEPAGE="http://velocity.apache.org/engine/devel/velocity-engine-core/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/velocity/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.velocity:velocity-engine-core:2.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.commons:commons-lang3:3.9 -> >=dev-java/commons-lang-3.10:3
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=dev-java/commons-lang-3.10:3
	>=dev-java/slf4j-api-2.0.0_alpha1:0
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

JAVA_GENTOO_CLASSPATH="commons-lang-3,slf4j-api"
