# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jdeb-1.1.1.pom --download-uri https://repo1.maven.org/maven2/org/vafer/jdeb/1.1.1/jdeb-1.1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jdeb-1.1.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="This library provides an Ant task and a Maven plugin to create Debian packages from Java builds in a truly cross
        platform manner. Build your Debian packages on any platform that has Java support. Windows, Linux, OS X - it doesn't
        require additional native tools installed."
HOMEPAGE="http://github.com/tcurdt/jdeb"
SRC_URI="https://repo1.maven.org/maven2/org/vafer/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/vafer/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.vafer:jdeb:1.1.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-io:commons-io:2.4 -> >=dev-java/commons-io-2.4:1
# org.apache.ant:ant:1.9.3 -> >=dev-java/ant-core-1.10.7:0
# org.apache.commons:commons-compress:1.7 -> >=dev-java/commons-compress-1.10:0
# org.apache.maven:maven-artifact:2.2.1 -> >=app-maven/maven-artifact-2.2.1:0
# org.apache.maven:maven-core:2.2.1 -> >=dev-java/maven-bin-3.0.5:3.0
# org.apache.maven:maven-plugin-api:2.2.1 -> >=app-maven/maven-plugin-api-2.2.1:0
# org.apache.maven:maven-project:2.2.1 -> >=app-maven/maven-project-2.2.1:0
# org.bouncycastle:bcpg-jdk15on:1.50 -> >=dev-java/bcpg-1.52:1.52
# org.codehaus.plexus:plexus-utils:1.5.15 -> >=app-maven/plexus-utils-1.5.15:0

CDEPEND="
	>=app-maven/maven-artifact-2.2.1:0
	>=app-maven/maven-plugin-api-2.2.1:0
	>=app-maven/maven-project-2.2.1:0
	>=app-maven/plexus-utils-1.5.15:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/bcpg-1.52:1.52
	>=dev-java/commons-compress-1.10:0
	>=dev-java/commons-io-2.4:1
	>=dev-java/maven-bin-3.0.5:3.0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.maven.plugin-tools:maven-plugin-annotations:3.2 -> >=app-maven/maven-plugin-annotations-3.2:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=app-maven/maven-plugin-annotations-3.2:0
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-io-1,ant-core,commons-compress,maven-artifact,maven-bin-3.0,maven-plugin-api,maven-project,bcpg-1.52,plexus-utils"
JAVA_CLASSPATH_EXTRA="maven-plugin-annotations"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
