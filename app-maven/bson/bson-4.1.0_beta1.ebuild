# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/bson-4.1.0-beta1.pom --download-uri https://repo.maven.apache.org/maven2/org/mongodb/bson/4.1.0-beta1/bson-4.1.0-beta1-sources.jar --slot 3.10 --keywords "~amd64" --ebuild bson-4.1.0_beta1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The BSON library"
HOMEPAGE="https://bsonspec.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/mongodb/${PN}/4.1.0-beta1/${PN}-4.1.0-beta1-sources.jar"
LICENSE=""
SLOT="3.10"
KEYWORDS="~amd64"
MAVEN_ID="org.mongodb:bson:4.1.0-beta1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-4.1.0-beta1.pom
# org.slf4j:slf4j-api:1.7.6 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/slf4j-api-1.7.7:0
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
