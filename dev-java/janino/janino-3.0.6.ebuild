# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/janino-3.0.6.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/janino/janino/3.0.6/janino-3.0.6-sources.jar --slot 0 --keywords "~amd64" --ebuild janino-3.0.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.codehaus.janino:janino:3.0.6"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Janino is a super-small, super-fast Java compiler."
HOMEPAGE="http://janino-compiler.github.io/janino/"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
#"x86"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.janino:commons-compiler:3.0.6 -> !!!groupId-not-found!!!

CDEPEND="
	>=dev-java/commons-compiler-3.0.6:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.ant:ant:1.7.1 -> >=dev-java/ant-core-1.10.7:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/ant-core-1.10.7:0
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-compiler"
JAVA_CLASSPATH_EXTRA="ant-core"
JAVA_SRC_DIR="src/main/java"
