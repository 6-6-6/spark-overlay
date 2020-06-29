# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/scala-library-2.12.10.pom --download-uri https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.10/scala-library-2.12.10-sources.jar --slot 0 --keywords "~amd64" --ebuild scala-library-2.12.10.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Standard library for the Scala Programming Language"
HOMEPAGE="https://www.scala-lang.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/scala-lang/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.scala-lang:scala-library:2.12.10"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

