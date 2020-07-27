# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-ejb-api_3.1_spec-1.0.0.CR2.pom --download-uri https://repo1.maven.org/maven2/org/jboss/spec/javax/ejb/jboss-ejb-api_3.1_spec/1.0.0.CR2/jboss-ejb-api_3.1_spec-1.0.0.CR2-sources.jar --slot 3.1_spec --keywords "~amd64" --ebuild jboss-ejb-api-1.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Java EJB 3.1 API classes"
HOMEPAGE="http://jboss-ejb-api_3.1_spec/"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/spec/javax/ejb/${PN}_3.1_spec/${PV}.CR2/${PN}_3.1_spec-${PV}.CR2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/spec/javax/ejb/${PN}_3.1_spec/${PV}.CR2/${PN}_3.1_spec-${PV}.CR2.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="3.1_spec"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.spec.javax.ejb:jboss-ejb-api_3.1_spec:1.0.0.CR2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_3.1_spec-${PV}.CR2.pom
# javax.xml:jaxrpc-api:1.1 -> >=dev-java/jsr101-1.4:0
# org.jboss.spec.javax.transaction:jboss-transaction-api_1.1_spec:1.0.0.Beta1 -> >=app-maven/jboss-transaction-api-1.0.0:1.1_spec

CDEPEND="
	>=app-maven/jboss-transaction-api-1.0.0:1.1_spec
	>=dev-java/jsr101-1.4:0
"


DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr101,jboss-transaction-api-1.1_spec"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${S}"/${JAVA_SRC_DIR}
	unzip "${DISTDIR}"/${P}-sources.jar -d "${S}"/${JAVA_SRC_DIR} || die
}
