# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/maven-ant-tasks-2.1.3.pom --download-uri https://repo1.maven.org/maven2/org/apache/maven/maven-ant-tasks/2.1.3/maven-ant-tasks-2.1.3-sources.jar --slot 0 --keywords "~amd64" --ebuild maven-ant-tasks-2.1.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Ant Tasks used for Maven integration"
HOMEPAGE="http://maven.apache.org/ant-tasks/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/maven/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/maven/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.maven:maven-ant-tasks:2.1.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# classworlds:classworlds:1.1-alpha-2 -> >=app-maven/classworlds-1.1_alpha2:0
# org.apache.ant:ant:1.8.0 -> >=dev-java/ant-core-1.10.7:0
# org.apache.maven:maven-artifact:2.2.1 -> >=app-maven/maven-artifact-2.2.1:0
# org.apache.maven:maven-artifact-manager:2.2.1 -> >=app-maven/maven-artifact-manager-2.2.1:0
# org.apache.maven:maven-error-diagnostics:2.2.1 -> >=app-maven/maven-error-diagnostics-2.2.1:0
# org.apache.maven:maven-model:2.2.1 -> >=app-maven/maven-model-2.2.1:0
# org.apache.maven:maven-project:2.2.1 -> >=app-maven/maven-project-2.2.1:0
# org.apache.maven:maven-settings:2.2.1 -> >=app-maven/maven-settings-2.2.1:0
# org.apache.maven.wagon:wagon-file:1.0-beta-6 -> >=app-maven/wagon-file-1.0_beta6:0
# org.apache.maven.wagon:wagon-http-lightweight:1.0-beta-6 -> >=app-maven/wagon-http-lightweight-1.0_beta6:0
# org.apache.maven.wagon:wagon-provider-api:1.0-beta-6 -> >=app-maven/wagon-provider-api-1.0_beta6:0
# org.codehaus.plexus:plexus-container-default:1.0-alpha-9-stable-1 -> >=app-maven/plexus-container-default-1.0.9.1:0
# org.codehaus.plexus:plexus-interpolation:1.11 -> >=app-maven/plexus-interpolation-1.11:0
# org.codehaus.plexus:plexus-utils:1.5.15 -> >=app-maven/plexus-utils-1.5.15:0

CDEPEND="
	>=app-maven/classworlds-1.1_alpha2:0
	>=app-maven/maven-artifact-2.2.1:0
	>=app-maven/maven-artifact-manager-2.2.1:0
	>=app-maven/maven-error-diagnostics-2.2.1:0
	>=app-maven/maven-model-2.2.1:0
	>=app-maven/maven-project-2.2.1:0
	>=app-maven/maven-settings-2.2.1:0
	>=app-maven/plexus-container-default-1.0.9.1:0
	>=app-maven/plexus-interpolation-1.11:0
	>=app-maven/plexus-utils-1.5.15:0
	>=app-maven/wagon-file-1.0_beta6:0
	>=app-maven/wagon-http-lightweight-1.0_beta6:0
	>=app-maven/wagon-provider-api-1.0_beta6:0
	>=dev-java/ant-core-1.10.7:0
"


DEPEND="
	>=virtual/jdk-1.4:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.4:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="classworlds,ant-core,maven-artifact,maven-artifact-manager,maven-error-diagnostics,maven-model,maven-project,maven-settings,wagon-file,wagon-http-lightweight,wagon-provider-api,plexus-container-default,plexus-interpolation,plexus-utils"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
