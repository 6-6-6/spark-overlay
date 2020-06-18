# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.annotation-api-1.3.2.pom --download-uri https://repo.maven.apache.org/maven2/javax/annotation/javax.annotation-api/1.3.2/javax.annotation-api-1.3.2-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-annotation-api-1.3.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Common Annotations for the JavaTM Platform API"
HOMEPAGE="http://jcp.org/en/jsr/detail?id=250"
SRC_URI="https://repo.maven.apache.org/maven2/javax/annotation/javax.annotation-api/${PV}/javax.annotation-api-${PV}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.annotation:javax.annotation-api:1.3.2"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

