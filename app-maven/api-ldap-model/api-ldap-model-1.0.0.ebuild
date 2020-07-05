# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/api-ldap-model-1.0.0-M20.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/directory/api/api-ldap-model/1.0.0-M20/api-ldap-model-1.0.0-M20-sources.jar --slot 0 --keywords "~amd64" --ebuild api-ldap-model-1.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Common LDAP Model used by clients and servers"
HOMEPAGE="http://directory.apache.org/api-parent/api-ldap-parent/api-ldap-model/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/directory/api/${PN}/${PV}-M20/${P}-M20-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.directory.api:api-ldap-model:1.0.0-M20"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M20.pom
# antlr:antlr:2.7.7 -> >=dev-java/antlr-2.7.7:0
# commons-collections:commons-collections:3.2.1 -> >=dev-java/commons-collections-3.2.1:0
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# org.apache.directory.api:api-asn1-api:1.0.0-M20 -> >=app-maven/api-asn1-api-1.0.0:0
# org.apache.directory.api:api-asn1-ber:1.0.0-M20 -> >=app-maven/api-asn1-ber-1.0.0:0
# org.apache.directory.api:api-i18n:1.0.0-M20 -> >=app-maven/api-i18n-1.0.0:0
# org.apache.directory.api:api-util:1.0.0-M20 -> >=app-maven/api-util-1.0.0:0
# org.apache.mina:mina-core:2.0.7 -> >=dev-java/mina-core-2.0.7:0
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=app-maven/api-asn1-api-1.0.0:0
	>=app-maven/api-asn1-ber-1.0.0:0
	>=app-maven/api-i18n-1.0.0:0
	>=app-maven/api-util-1.0.0:0
	>=dev-java/antlr-2.7.7:0
	>=dev-java/commons-collections-3.2.1:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/mina-core-2.0.7:0
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M20.pom
# findbugs:annotations:1.0.0 -> >=dev-java/findbugs-annotation-3.0.12:3

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/findbugs-annotation-3.0.12:3
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="antlr,commons-collections,commons-lang-2.1,api-asn1-api,api-asn1-ber,api-i18n,api-util,mina-core,slf4j-api"
JAVA_CLASSPATH_EXTRA="findbugs-annotation-3"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
