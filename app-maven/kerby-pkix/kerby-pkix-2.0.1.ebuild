# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kerby-pkix-2.0.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/kerby/kerby-pkix/2.0.1/kerby-pkix-2.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild kerby-pkix-2.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Kerby PKIX Project"
HOMEPAGE="https://directory.apache.org/kerby/kerby-pkix"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/kerby/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.kerby:kerby-pkix:2.0.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.kerby:kerby-asn1:2.0.1 -> >=app-maven/kerby-asn1-2.0.1:0
# org.apache.kerby:kerby-util:2.0.1 -> >=app-maven/kerby-util-2.0.1:0
# org.slf4j:slf4j-api:1.7.30 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/kerby-asn1-2.0.1:0
	>=app-maven/kerby-util-2.0.1:0
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

JAVA_GENTOO_CLASSPATH="kerby-asn1,kerby-util,slf4j-api"
