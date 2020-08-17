# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/apacheds-kerberos-codec-2.0.0-M15.pom --download-uri https://repo1.maven.org/maven2/org/apache/directory/server/apacheds-kerberos-codec/2.0.0-M15/apacheds-kerberos-codec-2.0.0-M15-sources.jar --slot 0 --keywords "~amd64" --ebuild apacheds-kerberos-codec-2.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.directory.server:apacheds-kerberos-codec:2.0.0-M15"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Kerberos protocol encoder/decoder module"
HOMEPAGE="http://directory.apache.org/apacheds/1.5/apacheds-kerberos-codec"
SRC_URI="https://repo1.maven.org/maven2/org/apache/directory/server/${PN}/${PV}-M15/${P}-M15-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/directory/server/${PN}/${PV}-M15/${P}-M15.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M15.pom
# net.sf.ehcache:ehcache-core:2.4.4 -> >=dev-java/ehcache-core-2.4.4:2
# org.apache.directory.api:api-asn1-api:1.0.0-M20 -> >=dev-java/api-asn1-api-1.0.0:0
# org.apache.directory.api:api-asn1-ber:1.0.0-M20 -> >=dev-java/api-asn1-ber-1.0.0:0
# org.apache.directory.api:api-i18n:1.0.0-M20 -> >=dev-java/api-i18n-1.0.0:0
# org.apache.directory.api:api-ldap-model:1.0.0-M20 -> >=dev-java/api-ldap-model-1.0.0:0
# org.apache.directory.api:api-util:1.0.0-M20 -> >=dev-java/api-util-1.0.0:0
# org.apache.directory.server:apacheds-i18n:2.0.0-M15 -> >=dev-java/apacheds-i18n-2.0.0:0
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/apacheds-i18n-2.0.0:0
	>=dev-java/api-asn1-api-1.0.0:0
	>=dev-java/api-asn1-ber-1.0.0:0
	>=dev-java/api-i18n-1.0.0:0
	>=dev-java/api-ldap-model-1.0.0:0
	>=dev-java/api-util-1.0.0:0
	>=dev-java/ehcache-2.4.4:2
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M15.pom
# findbugs:annotations:1.0.0 -> >=dev-java/findbugs-annotations-3.0.12:3

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/findbugs-annotations-3.0.12:3
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="ehcache-2,api-asn1-api,api-asn1-ber,api-i18n,api-ldap-model,api-util,apacheds-i18n,slf4j-api"
JAVA_CLASSPATH_EXTRA="findbugs-annotations-3"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
