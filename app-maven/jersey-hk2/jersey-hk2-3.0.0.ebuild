# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-hk2-3.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/org/glassfish/jersey/inject/jersey-hk2/3.0.0-M1/jersey-hk2-3.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-hk2-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="HK2 InjectionManager implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/project/jersey-hk2"
SRC_URI="https://repo.maven.apache.org/maven2/org/glassfish/jersey/inject/${PN}/${PV}-M1/${P}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.inject:jersey-hk2:3.0.0-M1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M1.pom
# org.glassfish.hk2:hk2-locator:2.6.1 -> >=app-maven/hk2-locator-2.6.1:0
# org.glassfish.jersey.core:jersey-common:3.0.0-M1 -> >=app-maven/jersey-common-3.0.0:0
# org.javassist:javassist:3.25.0-GA -> >=dev-java/javassist-3.18.2:3

CDEPEND="
	>=app-maven/hk2-locator-2.6.1:0
	>=app-maven/jersey-common-3.0.0:0
	>=dev-java/javassist-3.18.2:3
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

JAVA_GENTOO_CLASSPATH="hk2-locator,jersey-common,javassist-3"
