# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/weld-core-1.1.0.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/weld/weld-core/1.1.0.Final/weld-core-1.1.0.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild weld-core-1.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Weld's implementation of CDI"
HOMEPAGE="http://www.seamframework.org/Weld"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.weld:weld-core:1.1.0.Final"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# ch.qos.cal10n:cal10n-api:0.7.2 -> >=dev-java/cal10n-0.8.1:0
# com.google.guava:guava:r06 -> >=dev-java/guava-29.0:0
# javax.annotation:jsr250-api:1.0 -> >=dev-java/jsr250-1.2:0
# javax.el:el-api:2.2 -> >=java-virtuals/el-api-3.0:3.0
# javax.enterprise:cdi-api:1.0-SP4 -> >=dev-java/cdi-api-1.2:1.2
# javax.faces:jsf-api:2.0 -> >=app-maven/jsf-api-2.0:0
# javax.persistence:persistence-api:1.0 -> >=java-virtuals/persistence-api-1.0:0
# javax.servlet:servlet-api:2.5 -> >=java-virtuals/servlet-api-4.0:4.0
# javax.servlet.jsp:jsp-api:2.1 -> >=java-virtuals/jsp-api-2.3:2.3
# javax.transaction:jta:1.1 -> >=app-maven/jta-1.1:0
# javax.validation:validation-api:1.0.0.GA -> >=dev-java/validation-api-1.1.0:1.0
# net.sourceforge.findbugs:annotations:1.3.2 -> >=dev-java/findbugs-annotation-3.0.12:3
# org.javassist:javassist:3.14.0-GA -> >=dev-java/javassist-3.18.2:3
# org.jboss.interceptor:jboss-interceptor-core:2.0.0.CR1 -> >=app-maven/jboss-interceptor-core-2.0.0:0
# org.jboss.interceptor:jboss-interceptor-spi:2.0.0.CR1 -> >=app-maven/jboss-interceptor-spi-2.0.0:0
# org.jboss.spec.javax.ejb:jboss-ejb-api_3.1_spec:1.0.0.CR2 -> >=app-maven/jboss-ejb-api-1.0.0:3.1_spec
# org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.1_spec:1.0.0.Beta1 -> !!!artifactId-not-found!!!
# org.jboss.weld:weld-api:1.1.Final -> >=app-maven/weld-api-1.1:0
# org.jboss.weld:weld-spi:1.1.Final -> >=app-maven/weld-spi-1.1:0
# org.slf4j:slf4j-api:1.5.10 -> >=dev-java/slf4j-api-1.7.7:0
# org.slf4j:slf4j-ext:1.5.10 -> >=dev-java/slf4j-ext-1.7.5:0

CDEPEND="
	!!!artifactId-not-found!!!
	>=app-maven/jboss-ejb-api-1.0.0:3.1_spec
	>=app-maven/jboss-interceptor-core-2.0.0:0
	>=app-maven/jboss-interceptor-spi-2.0.0:0
	>=app-maven/jsf-api-2.0:0
	>=app-maven/jta-1.1:0
	>=app-maven/weld-api-1.1:0
	>=app-maven/weld-spi-1.1:0
	>=dev-java/cal10n-0.8.1:0
	>=dev-java/cdi-api-1.2:1.2
	>=dev-java/findbugs-annotation-3.0.12:3
	>=dev-java/guava-29.0:0
	>=dev-java/javassist-3.18.2:3
	>=dev-java/jsr250-1.2:0
	>=dev-java/slf4j-api-1.7.7:0
	>=dev-java/slf4j-ext-1.7.5:0
	>=dev-java/validation-api-1.1.0:1.0
	>=java-virtuals/el-api-3.0:3.0
	>=java-virtuals/jsp-api-2.3:2.3
	>=java-virtuals/persistence-api-1.0:0
	>=java-virtuals/servlet-api-4.0:4.0
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

JAVA_GENTOO_CLASSPATH="cal10n,guava,jsr250,el-api-3.0,cdi-api-1.2,jsf-api,persistence-api,servlet-api-4.0,jsp-api-2.3,jta,validation-api-1.0,findbugs-annotation-3,javassist-3,jboss-interceptor-core,jboss-interceptor-spi,jboss-ejb-api-3.1_spec,!!!artifactId-not-found!!!,weld-api,weld-spi,slf4j-api,slf4j-ext"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
