# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/groovy-all-3.0.4.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/groovy/groovy-all/3.0.4/groovy-all-3.0.4-sources.jar --slot 0 --keywords "~amd64" --ebuild groovy-all-3.0.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Groovy: A powerful, dynamic language for the JVM"
HOMEPAGE="https://groovy-lang.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/groovy/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.groovy:groovy-all:3.0.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.groovy:groovy:3.0.4 -> >=app-maven/groovy-3.0.4:0
# org.codehaus.groovy:groovy-ant:3.0.4 -> >=app-maven/groovy-ant-3.0.4:0
# org.codehaus.groovy:groovy-astbuilder:3.0.4 -> >=app-maven/groovy-astbuilder-3.0.4:0
# org.codehaus.groovy:groovy-cli-picocli:3.0.4 -> >=app-maven/groovy-cli-picocli-3.0.4:0
# org.codehaus.groovy:groovy-console:3.0.4 -> >=app-maven/groovy-console-3.0.4:0
# org.codehaus.groovy:groovy-datetime:3.0.4 -> >=app-maven/groovy-datetime-3.0.4:0
# org.codehaus.groovy:groovy-docgenerator:3.0.4 -> >=app-maven/groovy-docgenerator-3.0.4:0
# org.codehaus.groovy:groovy-groovydoc:3.0.4 -> >=app-maven/groovy-groovydoc-3.0.4:0
# org.codehaus.groovy:groovy-groovysh:3.0.4 -> >=app-maven/groovy-groovysh-3.0.4:0
# org.codehaus.groovy:groovy-jmx:3.0.4 -> >=app-maven/groovy-jmx-3.0.4:0
# org.codehaus.groovy:groovy-json:3.0.4 -> >=app-maven/groovy-json-3.0.4:0
# org.codehaus.groovy:groovy-jsr223:3.0.4 -> >=app-maven/groovy-jsr223-3.0.4:0
# org.codehaus.groovy:groovy-macro:3.0.4 -> >=app-maven/groovy-macro-3.0.4:0
# org.codehaus.groovy:groovy-nio:3.0.4 -> >=app-maven/groovy-nio-3.0.4:0
# org.codehaus.groovy:groovy-servlet:3.0.4 -> >=app-maven/groovy-servlet-3.0.4:0
# org.codehaus.groovy:groovy-sql:3.0.4 -> >=app-maven/groovy-sql-3.0.4:0
# org.codehaus.groovy:groovy-swing:3.0.4 -> >=app-maven/groovy-swing-3.0.4:0
# org.codehaus.groovy:groovy-templates:3.0.4 -> >=app-maven/groovy-templates-3.0.4:0
# org.codehaus.groovy:groovy-test:3.0.4 -> >=app-maven/groovy-test-3.0.4:0
# org.codehaus.groovy:groovy-test-junit5:3.0.4 -> >=app-maven/groovy-test-junit5-3.0.4:0
# org.codehaus.groovy:groovy-testng:3.0.4 -> >=app-maven/groovy-testng-3.0.4:0
# org.codehaus.groovy:groovy-xml:3.0.4 -> >=app-maven/groovy-xml-3.0.4:0

CDEPEND="
	>=app-maven/groovy-3.0.4:0
	>=app-maven/groovy-ant-3.0.4:0
	>=app-maven/groovy-astbuilder-3.0.4:0
	>=app-maven/groovy-cli-picocli-3.0.4:0
	>=app-maven/groovy-console-3.0.4:0
	>=app-maven/groovy-datetime-3.0.4:0
	>=app-maven/groovy-docgenerator-3.0.4:0
	>=app-maven/groovy-groovydoc-3.0.4:0
	>=app-maven/groovy-groovysh-3.0.4:0
	>=app-maven/groovy-jmx-3.0.4:0
	>=app-maven/groovy-json-3.0.4:0
	>=app-maven/groovy-jsr223-3.0.4:0
	>=app-maven/groovy-macro-3.0.4:0
	>=app-maven/groovy-nio-3.0.4:0
	>=app-maven/groovy-servlet-3.0.4:0
	>=app-maven/groovy-sql-3.0.4:0
	>=app-maven/groovy-swing-3.0.4:0
	>=app-maven/groovy-templates-3.0.4:0
	>=app-maven/groovy-test-3.0.4:0
	>=app-maven/groovy-test-junit5-3.0.4:0
	>=app-maven/groovy-testng-3.0.4:0
	>=app-maven/groovy-xml-3.0.4:0
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

JAVA_GENTOO_CLASSPATH="groovy,groovy-ant,groovy-astbuilder,groovy-cli-picocli,groovy-console,groovy-datetime,groovy-docgenerator,groovy-groovydoc,groovy-groovysh,groovy-jmx,groovy-json,groovy-jsr223,groovy-macro,groovy-nio,groovy-servlet,groovy-sql,groovy-swing,groovy-templates,groovy-test,groovy-test-junit5,groovy-testng,groovy-xml"
