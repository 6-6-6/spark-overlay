# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spring-beans-5.2.6.RELEASE.pom --download-uri https://repo.maven.apache.org/maven2/org/springframework/spring-beans/5.2.6.RELEASE/spring-beans-5.2.6.RELEASE-sources.jar --slot 0 --keywords "~amd64" --ebuild spring-beans-5.2.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Spring Beans"
HOMEPAGE="https://github.com/spring-projects/spring-framework"
SRC_URI="https://repo.maven.apache.org/maven2/org/springframework/${PN}/${PV}.RELEASE/${P}.RELEASE-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.springframework:spring-beans:5.2.6.RELEASE"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.RELEASE.pom
# org.springframework:spring-core:5.2.6.RELEASE -> >=app-maven/spring-core-5.2.6:0

CDEPEND="
	>=app-maven/spring-core-5.2.6:0
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

JAVA_GENTOO_CLASSPATH="spring-core"
