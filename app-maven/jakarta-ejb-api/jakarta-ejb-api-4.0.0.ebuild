# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.ejb-api-4.0.0-RC2.pom --download-uri https://repo.maven.apache.org/maven2/jakarta/ejb/jakarta.ejb-api/4.0.0-RC2/jakarta.ejb-api-4.0.0-RC2-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-ejb-api-4.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jakarta Enterprise Beans"
HOMEPAGE="https://github.com/eclipse-ee4j/ejb-api"
SRC_URI="https://repo.maven.apache.org/maven2/jakarta/ejb/jakarta.ejb-api/${PV}-RC2/jakarta.ejb-api-${PV}-RC2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jakarta.ejb:jakarta.ejb-api:4.0.0-RC2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/jakarta.ejb-api-${PV}-RC2.pom
# jakarta.transaction:jakarta.transaction-api:2.0.0-RC1 -> >=app-maven/jakarta-transaction-api-2.0.0:0

CDEPEND="
	>=app-maven/jakarta-transaction-api-2.0.0:0
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

JAVA_GENTOO_CLASSPATH="jakarta-transaction-api"
