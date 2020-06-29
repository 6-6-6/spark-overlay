# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/ehcache-core-2.4.4.pom --download-uri https://repo.maven.apache.org/maven2/net/sf/ehcache/ehcache-core/2.4.4/ehcache-core-2.4.4-sources.jar --slot 0 --keywords "~amd64" --ebuild ehcache-core-2.4.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="This is the ehcache core module. Pair it with other modules for added
        functionality."
HOMEPAGE="http://ehcache.org"
SRC_URI="https://repo.maven.apache.org/maven2/net/sf/ehcache/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="net.sf.ehcache:ehcache-core:2.4.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.6.1 -> >=dev-java/slf4j-ext-1.7.5:0

CDEPEND="
	>=dev-java/slf4j-ext-1.7.5:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:servlet-api:2.4 -> >=java-virtuals/servlet-api-2.4:2.4
# javax.transaction:jta:1.1 -> >=app-maven/jta-1.1:0
# org.hibernate:hibernate-core:3.5.1-Final -> >=dev-java/hibernate-core-6.0.0:0
# org.slf4j:slf4j-jdk14:1.6.1 -> >=dev-java/slf4j-ext-1.7.5:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jta-1.1:0
	>=dev-java/hibernate-core-6.0.0:0
	>=dev-java/slf4j-ext-1.7.5:0
	>=java-virtuals/servlet-api-2.4:2.4
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="slf4j-ext"
JAVA_CLASSPATH_EXTRA="servlet-api-2.4,jta,hibernate-core,slf4j-ext"
