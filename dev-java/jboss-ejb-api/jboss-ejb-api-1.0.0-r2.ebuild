# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-ejb-api_3.1_spec-1.0.0.CR2.pom --download-uri https://repo1.maven.org/maven2/org/jboss/spec/javax/ejb/jboss-ejb-api_3.1_spec/1.0.0.CR2/jboss-ejb-api_3.1_spec-1.0.0.CR2-sources.jar --slot 3.1_spec --keywords "~amd64" --ebuild jboss-ejb-api-1.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.spec.javax.ejb:jboss-ejb-api_3.1_spec:1.0.0.CR2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Java EJB 3.1 API classes"
HOMEPAGE="http://jboss-ejb-api_3.1_spec/"
SRC_URI="
	https://repo1.maven.org/maven2/org/jboss/spec/javax/ejb/${PN}_3.1_spec/${PV}.CR2/${PN}_3.1_spec-${PV}.CR2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/spec/javax/ejb/${PN}_3.1_spec/${PV}.CR2/${PN}_3.1_spec-${PV}.CR2.jar -> ${P}-bin.jar
"
LICENSE="LGPL-3"
SLOT="3.1_spec"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_3.1_spec-${PV}.CR2.pom
# javax.xml:jaxrpc-api:1.1 -> >=dev-java/javax-xml-rpc-api-1.1:0
# org.jboss.spec.javax.transaction:jboss-transaction-api_1.1_spec:1.0.0.Beta1 -> >=dev-java/jboss-transaction-api-1.0.0:1.1_spec

CDEPEND="
	>=dev-java/jboss-transaction-api-1.0.0:1.1_spec
	>=dev-java/javax-xml-rpc-api-1.1:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="javax-xml-rpc-api,jboss-transaction-api-1.1_spec"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
