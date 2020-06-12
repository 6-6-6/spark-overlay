# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/groovy-ant-3.0.4.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/groovy/groovy-ant/3.0.4/groovy-ant-3.0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild groovy-ant-3.0.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Groovy: A powerful, dynamic language for the JVM"
HOMEPAGE="https://groovy-lang.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/groovy/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.groovy:groovy-ant:3.0.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.ant:ant:1.10.8 -> >=dev-java/ant-core-1.10.7:0
# org.codehaus.groovy:groovy:3.0.4 -> >=app-maven/groovy-3.0.4:0

CDEPEND="
	>=app-maven/groovy-3.0.4:0
	>=dev-java/ant-core-1.10.7:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.ant:ant-antlr:1.10.8 -> >=dev-java/ant-antlr-1.10.7:0
# org.apache.ant:ant-junit:1.10.8 -> >=dev-java/ant-junit-1.10.7:0
# org.apache.ant:ant-launcher:1.10.8 -> >=app-maven/ant-launcher-1.10.8:0
# org.codehaus.groovy:groovy-groovydoc:3.0.4 -> >=app-maven/groovy-groovydoc-3.0.4:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=app-maven/ant-launcher-1.10.8:0

	>=app-maven/groovy-groovydoc-3.0.4:0

	>=dev-java/ant-antlr-1.10.7:0

	>=dev-java/ant-junit-1.10.7:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="ant-core,groovy,ant-antlr,ant-junit,ant-launcher,groovy-groovydoc"
