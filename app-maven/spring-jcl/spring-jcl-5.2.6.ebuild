# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spring-jcl-5.2.6.RELEASE.pom --download-uri https://repo.maven.apache.org/maven2/org/springframework/spring-jcl/5.2.6.RELEASE/spring-jcl-5.2.6.RELEASE-sources.jar --slot 0 --keywords "~amd64" --ebuild spring-jcl-5.2.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Spring Commons Logging Bridge"
HOMEPAGE="https://github.com/spring-projects/spring-framework"
SRC_URI="https://repo.maven.apache.org/maven2/org/springframework/${PN}/${PV}.RELEASE/${P}.RELEASE-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.springframework:spring-jcl:5.2.6.RELEASE"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

