# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hazelcast-3.8.9.pom --download-uri https://repo.maven.apache.org/maven2/com/hazelcast/hazelcast/3.8.9/hazelcast-3.8.9-sources.jar --slot 0 --keywords "~amd64" --ebuild hazelcast-3.8.9.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Core Hazelcast Module"
HOMEPAGE="http://www.hazelcast.com/hazelcast/"
SRC_URI="https://repo.maven.apache.org/maven2/com/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.hazelcast:hazelcast:3.8.9"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:annotations:3.0.0 -> >=dev-java/findbugs-annotation-3.0.12:3
# javax.cache:cache-api:1.0.0 -> >=app-maven/cache-api-1.0.0:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.logging.log4j:log4j-api:2.3 -> >=app-maven/log4j-api-2.3:0
# org.apache.logging.log4j:log4j-core:2.3 -> >=app-maven/log4j-core-2.3:0
# org.codehaus.groovy:groovy-all:2.1.8 -> >=app-maven/groovy-all-2.4.0:0
# org.jruby:jruby-complete:1.7.22 -> >=app-maven/jruby-complete-1.7.22:0
# org.osgi:org.osgi.core:4.2.0 -> >=dev-java/osgi-core-6.0.0:6
# org.slf4j:slf4j-api:1.6.6 -> >=dev-java/slf4j-api-1.7.7:0

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	>=app-maven/cache-api-1.0.0:0
	>=app-maven/groovy-all-2.4.0:0
	>=app-maven/jruby-complete-1.7.22:0
	>=app-maven/log4j-api-2.3:0
	>=app-maven/log4j-core-2.3:0
	>=dev-java/findbugs-annotation-3.0.12:3
	>=dev-java/log4j-1.2.17:0
	>=dev-java/osgi-core-6.0.0:6
	>=dev-java/slf4j-api-1.7.7:0
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="findbugs-annotation-3,cache-api,log4j,log4j-api,log4j-core,groovy-all,jruby-complete,osgi-core-6,slf4j-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
