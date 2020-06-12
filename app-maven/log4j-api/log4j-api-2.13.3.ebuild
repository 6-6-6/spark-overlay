# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/log4j-api-2.13.3.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/logging/log4j/log4j-api/2.13.3/log4j-api-2.13.3-sources.jar --slot 0 --keywords "~amd64" --ebuild log4j-api-2.13.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Log4j API"
HOMEPAGE="https://logging.apache.org/log4j/2.x/log4j-api/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/logging/log4j/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.logging.log4j:log4j-api:2.13.3"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:org.osgi.core:4.3.1 -> >=app-maven/osgi-core-6.0.0:6

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/osgi-core-6.0.0:6
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH_EXTRA="osgi-core-6"
