# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/istack-commons-runtime-4.0.0-M3.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/istack/istack-commons-runtime/4.0.0-M3/istack-commons-runtime-4.0.0-M3-sources.jar --slot 0 --keywords "~amd64" --ebuild istack-commons-runtime-4.0.0.ebuild

EAPI=8

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="com.sun.istack:istack-commons-runtime:4.0.0-M3"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="istack common utility code"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/istack-commons/istack-commons-runtime"
SRC_URI="
	https://repo.maven.apache.org/maven2/com/sun/istack/${PN}/${PV}-M3/${P}-M3-sources.jar -> ${P}-sources.jar
	https://repo.maven.apache.org/maven2/com/sun/istack/${PN}/${PV}-M3/${P}-M3.jar -> ${P}-bin.jar
"
LICENSE="CDDL"
SLOT="0"
KEYWORDS="~amd64"
#~ppc64 ~x86"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M3.pom
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> >=dev-java/jakarta-activation-api-2.0.0:2

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		>=dev-java/jakarta-activation-api-2.0.0:2
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-activation-api-2"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_RM_FILES=(
	"${JAVA_SRC_DIR}/module-info.java"
)
