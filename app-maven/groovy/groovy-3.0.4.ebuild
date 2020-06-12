# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/groovy-3.0.4.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/groovy/groovy/3.0.4/groovy-3.0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild groovy-3.0.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Groovy: A powerful, dynamic language for the JVM"
HOMEPAGE="https://groovy-lang.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.groovy:groovy:3.0.4"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.thoughtworks.xstream:xstream:1.4.12 -> >=app-maven/xstream-1.4.12:0
# com.tunnelvisionlabs:antlr4-runtime:4.7.4 -> >=app-maven/antlr4-runtime-4.7.4:0
# org.apache.ivy:ivy:2.5.0 -> >=dev-java/ant-ivy-1.4.1:0
# org.codehaus.gpars:gpars:1.2.1 -> >=app-maven/gpars-1.2.1:0
# org.fusesource.jansi:jansi:1.18 -> >=dev-java/jansi-1.5:0
RDEPEND="
	>=virtual/jre-1.8:*

	>=app-maven/antlr4-runtime-4.7.4:0

	>=app-maven/gpars-1.2.1:0

	>=app-maven/xstream-1.4.12:0

	>=dev-java/ant-ivy-1.4.1:0

	>=dev-java/jansi-1.5:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="xstream,antlr4-runtime,ant-ivy,gpars,jansi"
