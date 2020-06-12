# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/groovy-groovysh-3.0.4.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/groovy/groovy-groovysh/3.0.4/groovy-groovysh-3.0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild groovy-groovysh-3.0.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Groovy: A powerful, dynamic language for the JVM"
HOMEPAGE="https://groovy-lang.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/groovy/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.groovy:groovy-groovysh:3.0.4"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jline:jline:2.14.6 -> >=dev-java/jline-2.12.1:2
# org.codehaus.groovy:groovy:3.0.4 -> >=app-maven/groovy-3.0.4:0
# org.codehaus.groovy:groovy-console:3.0.4 -> >=app-maven/groovy-console-3.0.4:0
# org.codehaus.groovy:groovy-templates:3.0.4 -> >=app-maven/groovy-templates-3.0.4:0
# org.codehaus.groovy:groovy-xml:3.0.4 -> >=app-maven/groovy-xml-3.0.4:0
RDEPEND="
	>=virtual/jre-1.8:*

	>=app-maven/groovy-3.0.4:0

	>=app-maven/groovy-console-3.0.4:0

	>=app-maven/groovy-templates-3.0.4:0

	>=app-maven/groovy-xml-3.0.4:0

	>=dev-java/jline-2.12.1:2
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jline-2,groovy,groovy-console,groovy-templates,groovy-xml"
