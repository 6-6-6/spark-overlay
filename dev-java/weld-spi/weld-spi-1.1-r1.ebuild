# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/weld-spi-1.1.Final.pom --download-uri https://repo1.maven.org/maven2/org/jboss/weld/weld-spi/1.1.Final/weld-spi-1.1.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild weld-spi-1.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.weld:weld-spi:1.1.Final"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="APIs for Weld, the reference implementation of JSR 299: Contexts and Dependency Injection for Java EE"
HOMEPAGE="http://www.seamframework.org/Weld"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# javax.annotation:jsr250-api:1.0 -> >=dev-java/jsr250-1.2:0
# javax.enterprise:cdi-api:1.0-SP3 -> >=dev-java/cdi-api-1.2:1.2
# javax.faces:jsf-api:1.2_13 -> >=dev-java/jsf-api-2.0:0
# javax.persistence:persistence-api:1.0 -> >=dev-java/persistence-api-1.0:0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# javax.transaction:jta:1.1 -> >=dev-java/jta-1.1:0
# javax.validation:validation-api:1.0.0.GA -> >=dev-java/validation-api-1.1.0:1.0
# org.jboss.spec.javax.ejb:jboss-ejb-api_3.1_spec:1.0.0.CR2 -> >=dev-java/jboss-ejb-api-1.0.0:3.1_spec
# org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.1_spec:1.0.0.Beta1 -> >=dev-java/jboss-interceptors-api-1.0.0:1.1_spec
# org.jboss.weld:weld-api:1.1.Final -> >=dev-java/weld-api-1.1:0

CDEPEND="
	>=dev-java/jboss-ejb-api-1.0.0:3.1_spec
	>=dev-java/jboss-interceptors-api-1.0.0:1.1_spec
	>=dev-java/jsf-api-2.0:0
	>=dev-java/jta-1.1:0
	>=dev-java/persistence-api-1.0:0
	>=dev-java/weld-api-1.1:0
	>=dev-java/cdi-api-1.2:1.2
	>=dev-java/jsr250-1.2:0
	>=dev-java/validation-api-1.1.0:1.0
	java-virtuals/servlet-api:4.0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr250,cdi-api-1.2,jsf-api,persistence-api,servlet-api-4.0,jta,validation-api-1.0,jboss-ejb-api-3.1_spec,jboss-interceptors-api-1.1_spec,weld-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
