# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/error_prone_annotations-2.4.0.pom --download-uri https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.4.0/error_prone_annotations-2.4.0-sources.jar --slot prone_annotations --keywords "~amd64" --ebuild error-2.4.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN=error
DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/error_prone_parent/error_prone_annotations"
SRC_URI="https://repo.maven.apache.org/maven2/com/google/${MY_PN}prone/${MY_PN}_prone_annotations/${PV}/${MY_PN}_prone_annotations-${PV}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.google.errorprone:error_prone_annotations:2.4.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

