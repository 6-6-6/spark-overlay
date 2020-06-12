# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/unused-1.0.0.pom --download-uri https://repo.maven.apache.org/maven2/org/spark-project/spark/unused/1.0.0/unused-1.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild unused-1.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/unused"
SRC_URI="https://repo.maven.apache.org/maven2/org/spark-project/spark/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.spark-project.spark:unused:1.0.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

