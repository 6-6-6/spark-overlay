# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/groovy-2.5.12.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/groovy/groovy/2.5.12/groovy-2.5.12-sources.jar --slot 0 --keywords "~amd64" --ebuild groovy-2.5.12.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Groovy: A powerful, dynamic language for the JVM"
HOMEPAGE="https://groovy-lang.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.groovy:groovy:2.5.12"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.thoughtworks.xstream:xstream:1.4.10 -> >=app-maven/xstream-1.4.10:0
# info.picocli:picocli:4.3.2 -> >=app-maven/picocli-4.3.2:0
# org.apache.ant:ant:1.9.15 -> >=dev-java/ant-core-1.10.7:0
# org.apache.ivy:ivy:2.4.0 -> >=dev-java/ant-ivy-2.5.0:0
# org.fusesource.jansi:jansi:1.17.1 -> >=dev-java/jansi-1.18:0

CDEPEND="
	>=app-maven/picocli-4.3.2:0
	>=app-maven/xstream-1.4.10:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/ant-ivy-2.5.0:0
	>=dev-java/jansi-1.18:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.gpars:gpars:1.2.1 -> >=app-maven/gpars-1.2.1:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
"
#	>=app-maven/gpars-1.2.1:0

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="xstream,picocli,ant-core,ant-ivy,jansi"
#,gpars"
