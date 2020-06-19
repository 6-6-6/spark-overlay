# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jooq-3.13.2.pom --download-uri https://repo.maven.apache.org/maven2/org/jooq/jooq/3.13.2/jooq-3.13.2-sources.jar --slot 0 --keywords "~amd64" --ebuild jooq-3.13.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="jOOQ effectively combines complex SQL, typesafety, source code generation, active records,
        stored procedures, advanced data types, and Java in a fluent, intuitive DSL."
HOMEPAGE="http://www.jooq.org/jooq"
SRC_URI="https://repo.maven.apache.org/maven2/org/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jooq:jooq:3.13.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.xml.bind:jaxb-api:2.3.1 -> >=app-maven/jaxb-api-2.4.0.180830.0359:0
# org.reactivestreams:reactive-streams:1.0.2 -> >=dev-java/reactive-streams-1.0.3:0

CDEPEND="
	>=app-maven/jaxb-api-2.4.0.180830.0359:0
	>=dev-java/reactive-streams-1.0.3:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.persistence:javax.persistence-api:2.2 -> >=app-maven/javax-persistence-api-2.2:0
# org.slf4j:slf4j-api:1.8.0-beta4 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/javax-persistence-api-2.2:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jaxb-api,reactive-streams"
JAVA_CLASSPATH_EXTRA="javax-persistence-api,slf4j-api"
