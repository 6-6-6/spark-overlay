# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jdeb-0.8.pom --download-uri https://repo.maven.apache.org/maven2/org/vafer/jdeb/0.8/jdeb-0.8-sources.jar --slot 0 --keywords "~amd64" --ebuild jdeb-0.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="This library provides an Ant task and a Maven plugin to create Debian packages from Java builds in a truly cross
      platform manner. Build your Debian packages on any platform that has Java support. Windows, Linux - it does not
      require additional native tools installed. The API underneath is well abstracted can easily be adopted for other
      areas as well."
HOMEPAGE="http://vafer.org/projects/jdeb"
SRC_URI="https://repo.maven.apache.org/maven2/org/vafer/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.vafer:jdeb:0.8"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.ant:ant:1.7.1 -> >=dev-java/ant-core-1.10.7:0
# org.apache.commons:commons-compress:1.0 -> >=dev-java/commons-compress-1.10:0
# org.apache.maven:maven-artifact:2.1.0 -> >=app-maven/maven-artifact-2.2.1:0
# org.apache.maven:maven-plugin-api:2.1.0 -> >=app-maven/maven-plugin-api-2.1.0:0
# org.apache.maven:maven-project:2.1.0 -> >=app-maven/maven-project-2.2.1:0
# org.bouncycastle:bcpg-jdk12:130 -> >=dev-java/bcpg-1.52:1.52
# org.codehaus.plexus:plexus-utils:1.4.1 -> >=app-maven/plexus-utils-1.5.15:0

CDEPEND="
	>=app-maven/maven-artifact-2.2.1:0
	>=app-maven/maven-plugin-api-2.1.0:0
	>=app-maven/maven-project-2.2.1:0
	>=app-maven/plexus-utils-1.5.15:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/bcpg-1.52:1.52
	>=dev-java/commons-compress-1.10:0
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

JAVA_GENTOO_CLASSPATH="ant-core,commons-compress,maven-artifact,maven-plugin-api,maven-project,bcpg-1.52,plexus-utils"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
