# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/apache-rat-core-0.6.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/rat/apache-rat-core/0.6/apache-rat-core-0.6-sources.jar --slot 0 --keywords "~amd64" --ebuild apache-rat-core-0.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The core functionality of RAT, shared by the Ant tasks,
    and the Maven plugin."
HOMEPAGE="http://incubator.apache.org/rat/apache-rat-core"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/rat/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.rat:apache-rat-core:0.6"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-cli:commons-cli:1.1 -> >=dev-java/commons-cli-1.3.1:1
# commons-collections:commons-collections:3.2 -> >=dev-java/commons-collections-3.2.1:0
# commons-lang:commons-lang:2.1 -> >=dev-java/commons-lang-2.6:2.1

CDEPEND="
	>=dev-java/commons-cli-1.3.1:1
	>=dev-java/commons-collections-3.2.1:0
	>=dev-java/commons-lang-2.6:2.1
"


DEPEND="
	>=virtual/jdk-1.4:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.4:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-cli-1,commons-collections,commons-lang-2.1"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
