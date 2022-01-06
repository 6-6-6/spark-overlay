# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.vafer:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Create Debian packages from Java builds in a truly cross platform manner"
HOMEPAGE="https://github.com/tcurdt/jdeb"
SRC_URI="
	https://repo1.maven.org/maven2/org/vafer/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/vafer/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Upstream pre-built JAR contains shaded classes under org.vafer.jdeb.shaded,
# which require additional sources not in the source JAR to compile
IUSE="+binary"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-io:commons-io:2.4 -> >=dev-java/commons-io-2.4:1
# org.apache.ant:ant:1.9.3 -> >=dev-java/ant-core-1.10.7:0
# org.apache.commons:commons-compress:1.7 -> >=dev-java/commons-compress-1.10:0
# org.apache.maven:maven-artifact:2.2.1 -> >=dev-java/maven-artifact-2.2.1:0
# org.apache.maven:maven-core:2.2.1 -> >=dev-java/maven-bin-3.8.1:3.8
# org.apache.maven:maven-plugin-api:2.2.1 -> >=dev-java/maven-plugin-api-2.2.1:0
# org.apache.maven:maven-project:2.2.1 -> >=dev-java/maven-project-2.2.1:0
# org.bouncycastle:bcpg-jdk15on:1.50 -> >=dev-java/bcpg-1.50:0
# org.codehaus.plexus:plexus-utils:1.5.15 -> >=dev-java/plexus-utils-1.5.15:0

CP_DEPEND="
	>=dev-java/maven-artifact-2.2.1:0
	>=dev-java/maven-plugin-api-2.2.1:0
	>=dev-java/maven-project-2.2.1:0
	>=dev-java/plexus-utils-1.5.15:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/bcpg-1.50:0
	>=dev-java/commons-compress-1.10:0
	>=dev-java/commons-io-2.4:1
	>=dev-java/maven-bin-3.8.1:3.8
"

BDEPEND="
	app-arch/unzip
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.maven.plugin-tools:maven-plugin-annotations:3.2 -> >=dev-java/maven-plugin-annotations-3.2:0

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
		>=dev-java/maven-plugin-annotations-3.2:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="maven-plugin-annotations"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
