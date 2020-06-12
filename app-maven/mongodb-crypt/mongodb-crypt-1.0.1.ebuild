# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/mongodb-crypt-1.0.1.pom --download-uri https://repo.maven.apache.org/maven2/org/mongodb/mongodb-crypt/1.0.1/mongodb-crypt-1.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild mongodb-crypt-1.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="MongoDB client-side crypto support"
HOMEPAGE="http://www.mongodb.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/mongodb/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.mongodb:mongodb-crypt:1.0.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# net.java.dev.jna:jna:4.5.2 -> >=dev-java/jna-3.4.1:0
# org.mongodb:bson:[3.10,5.0) -> >=app-maven/bson-4.1.0_beta1:3.10

CDEPEND="
	>=app-maven/bson-4.1.0_beta1:3.10
	>=dev-java/jna-3.4.1:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.7.6 -> >=dev-java/slf4j-api-1.7.7:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=dev-java/slf4j-api-1.7.7:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jna,bson-3.10,slf4j-api"
