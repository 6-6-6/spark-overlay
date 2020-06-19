# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/cache-api-1.1.1.pom --download-uri https://repo.maven.apache.org/maven2/javax/cache/cache-api/1.1.1/cache-api-1.1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild cache-api-1.1.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="https://github.com/jsr107/jsr107spec"
SRC_URI="https://repo.maven.apache.org/maven2/javax/cache/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.cache:cache-api:1.1.1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.enterprise:cdi-api:1.0-SP4 -> >=dev-java/cdi-api-1.2:1.2

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=dev-java/cdi-api-1.2:1.2
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="cdi-api-1.2"
