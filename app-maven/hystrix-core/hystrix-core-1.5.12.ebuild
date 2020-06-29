# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hystrix-core-1.5.12.pom --download-uri https://repo.maven.apache.org/maven2/com/netflix/hystrix/hystrix-core/1.5.12/hystrix-core-1.5.12-sources.jar --slot 0 --keywords "~amd64" --ebuild hystrix-core-1.5.12.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="hystrix-core"
HOMEPAGE="https://github.com/Netflix/Hystrix"
SRC_URI="https://repo.maven.apache.org/maven2/com/netflix/hystrix/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.netflix.hystrix:hystrix-core:1.5.12"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.netflix.archaius:archaius-core:0.4.1 -> >=app-maven/archaius-core-0.4.1:0
# io.reactivex:rxjava:1.2.0 -> >=app-maven/rxjava-1.2.0:0
# org.hdrhistogram:HdrHistogram:2.1.9 -> >=app-maven/HdrHistogram-2.1.9:0

CDEPEND="
	>=app-maven/HdrHistogram-2.1.9:0
	>=app-maven/archaius-core-0.4.1:0
	>=app-maven/rxjava-1.2.0:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.slf4j:slf4j-api:1.7.0 -> >=dev-java/slf4j-ext-1.7.5:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=dev-java/slf4j-ext-1.7.5:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="archaius-core,rxjava,HdrHistogram,slf4j-ext"
