# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/plexus-utils-1.5.15.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/plexus/plexus-utils/1.5.15/plexus-utils-1.5.15-sources.jar --slot 0 --keywords "~amd64" --ebuild plexus-utils-1.5.15.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A collection of various utility classes to ease working with strings, files, command lines, XML and more."
HOMEPAGE="http://plexus.codehaus.org/plexus-utils"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/plexus/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.plexus:plexus-utils:1.5.15"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.plexus:plexus-interpolation:1.11 -> >=app-maven/plexus-interpolation-1.11:0

DEPEND="
	>=virtual/jdk-1.4:*
	app-arch/unzip
	>=app-maven/plexus-interpolation-1.11:0
"

RDEPEND="
	>=virtual/jre-1.4:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="plexus-interpolation"
