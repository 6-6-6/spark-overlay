# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-beanutils-1.9.4.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/commons-beanutils/commons-beanutils/1.9.4/commons-beanutils-1.9.4-sources.jar --binjar-uri https://repo1.maven.org/maven2/commons-beanutils/commons-beanutils/1.9.4/commons-beanutils-1.9.4.jar --slot 0 --keywords "~amd64" --ebuild commons-beanutils-1.9.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="commons-beanutils:commons-beanutils:1.9.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Commons BeanUtils provides an easy-to-use but flexible wrapper around reflection and introspection."
HOMEPAGE="https://commons.apache.org/proper/commons-beanutils/"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-collections:commons-collections:3.2.2 -> >=dev-java/commons-collections-3.2.2:3
# commons-logging:commons-logging:1.2 -> >=dev-java/commons-logging-1.2:0

CDEPEND="
	>=dev-java/commons-collections-3.2.2:3
	>=dev-java/commons-logging-1.2:0
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

JAVA_ENCODING="iso-8859-1"

JAVA_GENTOO_CLASSPATH="commons-collections-3,commons-logging"
JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=(
	"src/main/resources"
	""
)
JAVA_BINJAR_FILENAME="${P}-bin.jar"
