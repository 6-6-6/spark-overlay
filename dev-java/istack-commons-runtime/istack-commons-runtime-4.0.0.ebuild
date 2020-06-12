# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/istack-commons-runtime-4.0.0-M3.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/istack/istack-commons-runtime/4.0.0-M3/istack-commons-runtime-4.0.0-M3-sources.jar --slot 0 --keywords "~amd64" --ebuild istack-commons-runtime-4.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="istack common utility code"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/istack-commons/istack-commons-runtime"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/istack/${PN}/${PV}-M3/${P}-M3-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.istack:istack-commons-runtime:4.0.0-M3"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M3.pom
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> !!!groupId-not-found!!!

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/jakarta-activation-api-2.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH_EXTRA="jakarta-activation-api"
