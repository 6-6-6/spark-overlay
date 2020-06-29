# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/weld-spi-1.1.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/weld/weld-spi/1.1.Final/weld-spi-1.1.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild weld-spi-1.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="APIs for Weld, the reference implementation of JSR 299: Contexts and Dependency Injection for Java EE"
HOMEPAGE="http://www.seamframework.org/Weld"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.weld:weld-spi:1.1.Final"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# javax.annotation:jsr250-api:1.0 -> >=dev-java/jsr250-1.2:0
# javax.enterprise:cdi-api:1.0-SP3 -> >=dev-java/cdi-api-1.2:1.2
# javax.faces:jsf-api:1.2_13 -> >=app-maven/jsf-api-2.0:0
# javax.persistence:persistence-api:1.0 -> >=app-maven/persistence-api-1.0:0
# javax.servlet:servlet-api:2.5 -> >=java-virtuals/servlet-api-2.5:2.5
# javax.transaction:jta:1.1 -> >=app-maven/jta-1.1:0
# javax.validation:validation-api:1.0.0.GA -> >=dev-java/validation-api-1.1.0:1.0
# org.jboss.spec.javax.ejb:jboss-ejb-api_3.1_spec:1.0.0.CR2 -> >=app-maven/jboss-ejb-api-1.0.0:3.1_spec
# org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.1_spec:1.0.0.Beta1 -> >=app-maven/jboss-interceptors-api-1.0.0:1.1_spec
# org.jboss.weld:weld-api:1.1.Final -> >=app-maven/weld-api-1.1:0

CDEPEND="
	>=app-maven/jboss-ejb-api-1.0.0:3.1_spec
	>=app-maven/jboss-interceptors-api-1.0.0:1.1_spec
	>=app-maven/jsf-api-2.0:0
	>=app-maven/jta-1.1:0
	>=app-maven/persistence-api-1.0:0
	>=app-maven/weld-api-1.1:0
	>=dev-java/cdi-api-1.2:1.2
	>=dev-java/jsr250-1.2:0
	>=dev-java/validation-api-1.1.0:1.0
	>=java-virtuals/servlet-api-2.5:2.5
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

JAVA_GENTOO_CLASSPATH="jsr250,cdi-api-1.2,jsf-api,persistence-api,servlet-api-2.5,jta,validation-api-1.0,jboss-ejb-api-3.1_spec,jboss-interceptors-api-1.1_spec,weld-api"
