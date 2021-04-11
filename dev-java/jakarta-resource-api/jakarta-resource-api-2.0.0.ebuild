# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.resource-api-2.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/jakarta/resource/jakarta.resource-api/2.0.0/jakarta.resource-api-2.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/jakarta/resource/jakarta.resource-api/2.0.0/jakarta.resource-api-2.0.0.jar --slot 0 --keywords "~amd64" --ebuild jakarta-resource-api-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="jakarta.resource:jakarta.resource-api:2.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jakarta Connectors 2.0"
HOMEPAGE="https://github.com/eclipse-ee4j/jca-api"
SRC_URI="https://repo1.maven.org/maven2/jakarta/resource/jakarta.resource-api/${PV}/jakarta.resource-api-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/jakarta/resource/jakarta.resource-api/${PV}/jakarta.resource-api-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-2.0 GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.resource-api-${PV}.pom
# jakarta.annotation:jakarta.annotation-api:2.0.0 -> >=dev-java/jakarta-annotation-api-2.0.0:0
# jakarta.transaction:jakarta.transaction-api:2.0.0-RC1 -> >=dev-java/jakarta-transaction-api-2.0.0:2

CDEPEND="
	>=dev-java/jakarta-annotation-api-2.0.0:0
	>=dev-java/jakarta-transaction-api-2.0.0:2
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-annotation-api,jakarta-transaction-api-2"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
