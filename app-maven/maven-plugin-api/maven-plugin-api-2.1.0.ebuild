# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/maven-plugin-api-2.1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/maven/maven-plugin-api/2.1.0/maven-plugin-api-2.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild maven-plugin-api-2.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Maven is a project development management and comprehension tool. Based on the concept of a project object model: builds, dependency management, documentation creation, site publication, and distribution publication are all controlled from the declarative file. Maven can be extended by plugins to utilise a number of other development tools for reporting or the build process."
HOMEPAGE="http://maven.apache.org/maven-plugin-api"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/maven/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.maven:maven-plugin-api:2.1.0"



DEPEND="
	>=virtual/jdk-1.4:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.4:*
"

S="${WORKDIR}"

