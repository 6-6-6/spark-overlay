# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-ejb-api_3.1_spec-1.0.0.CR2.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/spec/javax/ejb/jboss-ejb-api_3.1_spec/1.0.0.CR2/jboss-ejb-api_3.1_spec-1.0.0.CR2-sources.jar --slot 3.1_spec --keywords "~amd64" --ebuild jboss-ejb-api-1.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Java EJB 3.1 API classes"
HOMEPAGE="http://jboss-ejb-api_3.1_spec/"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/spec/javax/ejb/${PN}_3.1_spec/${PV}.CR2/${PN}_3.1_spec-${PV}.CR2-sources.jar"
LICENSE=""
SLOT="3.1_spec"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.spec.javax.ejb:jboss-ejb-api_3.1_spec:1.0.0.CR2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_3.1_spec-${PV}.CR2.pom
# javax.xml:jaxrpc-api:1.1 -> >=app-maven/jaxrpc-api-1.1:0
# org.jboss.spec.javax.transaction:jboss-transaction-api_1.1_spec:1.0.0.Beta1 -> >=app-maven/jboss-transaction-api-1.0.0:1.1_spec

CDEPEND="
	>=app-maven/jaxrpc-api-1.1:0
	>=app-maven/jboss-transaction-api-1.0.0:1.1_spec
"


DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jaxrpc-api,jboss-transaction-api-1.1_spec"
