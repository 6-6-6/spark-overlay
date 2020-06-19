# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/groovy-all-2.5.12.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/groovy/groovy-all/2.5.12/groovy-all-2.5.12-sources.jar --slot 0 --keywords "~amd64" --ebuild groovy-all-2.5.12.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Groovy: A powerful, dynamic language for the JVM"
HOMEPAGE="https://groovy-lang.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/groovy/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.groovy:groovy-all:2.5.12"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.groovy:groovy:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-ant:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-cli-commons:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-cli-picocli:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-console:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-datetime:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-docgenerator:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-groovydoc:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-groovysh:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-jmx:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-json:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-jsr223:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-macro:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-nio:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-servlet:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-sql:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-swing:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-templates:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-test:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-test-junit5:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-testng:2.5.12 -> !!!groupId-not-found!!!
# org.codehaus.groovy:groovy-xml:2.5.12 -> !!!groupId-not-found!!!

CDEPEND="
	>=app-maven/groovy-2.5.12:0
	>=app-maven/groovy-ant-2.5.12:0
	>=app-maven/groovy-cli-commons-2.5.12:0
	>=app-maven/groovy-cli-picocli-2.5.12:0
	>=app-maven/groovy-console-2.5.12:0
	>=app-maven/groovy-datetime-2.5.12:0
	>=app-maven/groovy-docgenerator-2.5.12:0
	>=app-maven/groovy-groovydoc-2.5.12:0
	>=app-maven/groovy-groovysh-2.5.12:0
	>=app-maven/groovy-jmx-2.5.12:0
	>=app-maven/groovy-json-2.5.12:0
	>=app-maven/groovy-jsr223-2.5.12:0
	>=app-maven/groovy-macro-2.5.12:0
	>=app-maven/groovy-nio-2.5.12:0
	>=app-maven/groovy-servlet-2.5.12:0
	>=app-maven/groovy-sql-2.5.12:0
	>=app-maven/groovy-swing-2.5.12:0
	>=app-maven/groovy-templates-2.5.12:0
	>=app-maven/groovy-test-2.5.12:0
	>=app-maven/groovy-test-junit5-2.5.12:0
	>=app-maven/groovy-testng-2.5.12:0
	>=app-maven/groovy-xml-2.5.12:0
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

JAVA_GENTOO_CLASSPATH="groovy,groovy-ant,groovy-cli-commons,groovy-cli-picocli,groovy-console,groovy-datetime,groovy-docgenerator,groovy-groovydoc,groovy-groovysh,groovy-jmx,groovy-json,groovy-jsr223,groovy-macro,groovy-nio,groovy-servlet,groovy-sql,groovy-swing,groovy-templates,groovy-test,groovy-test-junit5,groovy-testng,groovy-xml"
