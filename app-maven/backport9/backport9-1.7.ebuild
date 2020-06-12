# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/backport9-1.7.pom --download-uri https://repo.maven.apache.org/maven2/com/headius/backport9/1.7/backport9-1.7-sources.jar --slot 0 --keywords "~amd64" --ebuild backport9-1.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/backport9"
SRC_URI="https://repo.maven.apache.org/maven2/com/headius/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.headius:backport9:1.7"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

