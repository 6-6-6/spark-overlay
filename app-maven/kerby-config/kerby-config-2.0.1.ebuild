# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kerby-config-2.0.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/kerby/kerby-config/2.0.1/kerby-config-2.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild kerby-config-2.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Kerby config library"
HOMEPAGE="https://directory.apache.org/kerby/kerby-common/kerby-config"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/kerby/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.kerby:kerby-config:2.0.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=dev-java/slf4j-api-2.0.0_alpha1:0
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

JAVA_GENTOO_CLASSPATH="slf4j-api"
