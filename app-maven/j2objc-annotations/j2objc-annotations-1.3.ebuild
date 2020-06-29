# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/j2objc-annotations-1.3.pom --download-uri https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.3/j2objc-annotations-1.3-sources.jar --slot 0 --keywords "~amd64" --ebuild j2objc-annotations-1.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A set of annotations that provide additional information to the J2ObjC
    translator to modify the result of translation."
HOMEPAGE="https://github.com/google/j2objc/"
SRC_URI="https://repo.maven.apache.org/maven2/com/google/j2objc/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.google.j2objc:j2objc-annotations:1.3"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

