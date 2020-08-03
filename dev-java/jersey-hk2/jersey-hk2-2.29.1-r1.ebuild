# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-hk2-2.29.1.pom --download-uri https://repo1.maven.org/maven2/org/glassfish/jersey/inject/jersey-hk2/2.29.1/jersey-hk2-2.29.1-sources.jar --slot 2 --keywords "~amd64" --ebuild jersey-hk2-2.29.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="HK2 InjectionManager implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey/project/jersey-hk2"
SRC_URI="https://repo1.maven.org/maven2/org/glassfish/jersey/inject/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/glassfish/jersey/inject/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="CC0-1.0 EPL-2.0 public-domain W3C BSD-2 GPL-2-with-classpath-exception Apache-2.0 MIT EPL-1.0 BSD"
SLOT="2"
KEYWORDS="~amd64"
MAVEN_ID="org.glassfish.jersey.inject:jersey-hk2:2.29.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.glassfish.hk2:hk2-locator:2.6.1 -> >=dev-java/hk2-locator-2.6.1:0
# org.glassfish.jersey.core:jersey-common:2.29.1 -> >=dev-java/jersey-common-2.29.1:2

CDEPEND="
	>=dev-java/hk2-locator-2.6.1:0
	>=dev-java/jersey-common-2.29.1:2
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="hk2-locator,jersey-common-2"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
