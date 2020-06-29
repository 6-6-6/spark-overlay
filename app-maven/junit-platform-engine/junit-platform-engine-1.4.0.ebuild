# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/junit-platform-engine-1.4.0.pom --download-uri https://repo.maven.apache.org/maven2/org/junit/platform/junit-platform-engine/1.4.0/junit-platform-engine-1.4.0-sources.jar --slot 0 --keywords "~amd64" --ebuild junit-platform-engine-1.4.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Module \"junit-platform-engine\" of JUnit 5."
HOMEPAGE="https://junit.org/junit5/"
SRC_URI="https://repo.maven.apache.org/maven2/org/junit/platform/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.junit.platform:junit-platform-engine:1.4.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apiguardian:apiguardian-api:1.0.0 -> >=app-maven/apiguardian-api-1.0.0:0
# org.junit.platform:junit-platform-commons:1.4.0 -> >=app-maven/junit-platform-commons-1.4.0:0
# org.opentest4j:opentest4j:1.1.1 -> >=app-maven/opentest4j-1.1.1:0

CDEPEND="
	>=app-maven/apiguardian-api-1.0.0:0
	>=app-maven/junit-platform-commons-1.4.0:0
	>=app-maven/opentest4j-1.1.1:0
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

JAVA_GENTOO_CLASSPATH="apiguardian-api,junit-platform-commons,opentest4j"
