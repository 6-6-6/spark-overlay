# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hibernate-entitymanager-5.2.13.Final.pom --download-uri https://repo1.maven.org/maven2/org/hibernate/hibernate-entitymanager/5.2.13.Final/hibernate-entitymanager-5.2.13.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild hibernate-entitymanager-5.2.13-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="(deprecated - use hibernate-core instead) Hibernate O/RM implementation of the JPA specification"
HOMEPAGE="http://hibernate.org"
SRC_URI="https://repo1.maven.org/maven2/org/hibernate/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/hibernate/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.hibernate:hibernate-entitymanager:5.2.13.Final"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# dom4j:dom4j:1.6.1 -> >=dev-java/dom4j-1.6.1:1
# net.bytebuddy:byte-buddy:1.6.14 -> >=app-maven/byte-buddy-1.6.14:0
# org.hibernate:hibernate-core:5.2.13.Final -> >=app-maven/hibernate-core-5.2.13:0
# org.hibernate.common:hibernate-commons-annotations:5.0.1.Final -> >=app-maven/hibernate-commons-annotations-5.0.1:0
# org.hibernate.javax.persistence:hibernate-jpa-2.1-api:1.0.0.Final -> >=app-maven/hibernate-jpa-1.0.0:2.1-api
# org.javassist:javassist:3.22.0-GA -> >=dev-java/javassist-3.21.0:3
# org.jboss.logging:jboss-logging:3.3.1.Final -> >=dev-java/jboss-logging-3.4.0:0
# org.jboss.spec.javax.transaction:jboss-transaction-api_1.2_spec:1.0.1.Final -> >=app-maven/jboss-transaction-api-1.0.1:1.2_spec

CDEPEND="
	>=app-maven/byte-buddy-1.6.14:0
	>=app-maven/hibernate-commons-annotations-5.0.1:0
	>=app-maven/hibernate-core-5.2.13:0
	>=app-maven/hibernate-jpa-1.0.0:2.1-api
	>=app-maven/jboss-transaction-api-1.0.1:1.2_spec
	>=dev-java/dom4j-1.6.1:1
	>=dev-java/javassist-3.21.0:3
	>=dev-java/jboss-logging-3.4.0:0
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

JAVA_GENTOO_CLASSPATH="dom4j-1,byte-buddy,hibernate-core,hibernate-commons-annotations,hibernate-jpa-2.1-api,javassist-3,jboss-logging,jboss-transaction-api-1.2_spec"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
