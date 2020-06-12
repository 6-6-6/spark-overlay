# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/archaius-core-2.0.0-rc.7.pom --download-uri https://repo.maven.apache.org/maven2/com/netflix/archaius/archaius-core/2.0.0-rc.7/archaius-core-2.0.0-rc.7-sources.jar --slot 0 --keywords "~amd64" --ebuild archaius-core-2.0.0.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="archaius-core"
HOMEPAGE="https://github.com/Netflix/archaius"
SRC_URI="https://repo.maven.apache.org/maven2/com/netflix/archaius/${PN}/2.0.0-rc.7/${PN}-2.0.0-rc.7-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.netflix.archaius:archaius-core:2.0.0-rc.7"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-2.0.0-rc.7.pom
# org.apache.commons:commons-lang3:3.3.2 -> >=dev-java/commons-lang-3.10:3
# org.slf4j:slf4j-api:1.6.3 -> >=dev-java/slf4j-simple-1.7.7:0
RDEPEND="
	>=virtual/jre-1.8:*

	>=dev-java/commons-lang-3.10:3

	>=dev-java/slf4j-simple-1.7.7:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-lang-3,slf4j-simple"
