# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hibernate-core-5.2.13.Final.pom --download-uri https://repo1.maven.org/maven2/org/hibernate/hibernate-core/5.2.13.Final/hibernate-core-5.2.13.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild hibernate-core-5.2.13-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_PROVIDES="
	org.hibernate:hibernate-core:5.2.13.Final
	org.hibernate:hibernate-entitymanager:5.2.13.Final
"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The core O/RM functionality as provided by Hibernate"
HOMEPAGE="https://hibernate.org"
SRC_URI="
	https://repo1.maven.org/maven2/org/hibernate/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/hibernate/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar
"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# antlr:antlr:2.7.7 -> >=dev-java/antlr-2.7.7:0
# com.fasterxml:classmate:1.3.0 -> >=dev-java/classmate-1.5.1:0
# dom4j:dom4j:1.6.1 -> >=dev-java/dom4j-1.6.1:1
# org.hibernate.common:hibernate-commons-annotations:5.0.1.Final -> >=dev-java/hibernate-commons-annotations-5.0.1:0
# org.hibernate.javax.persistence:hibernate-jpa-2.1-api:1.0.0.Final -> >=dev-java/hibernate-jpa-1.0.0:2.1-api
# org.javassist:javassist:3.22.0-GA -> >=dev-java/javassist-3.21.0:3
# org.jboss:jandex:2.0.3.Final -> >=dev-java/jandex-2.0.3:0
# org.jboss.logging:jboss-logging:3.3.1.Final -> >=dev-java/jboss-logging-3.4.0:0
# org.jboss.spec.javax.transaction:jboss-transaction-api_1.2_spec:1.0.1.Final -> >=dev-java/jboss-transaction-api-1.0.1:1.2_spec

# Additional dependencies
# javax.enterprise.inject.spi -> dev-java/cdi-api:1.2
# javax.security.jacc -> dev-java/javax-security-jacc-api:0
# org.apache.tools.ant -> dev-java/ant-core:0

CDEPEND="
	>=dev-java/hibernate-commons-annotations-5.0.1:0
	>=dev-java/hibernate-jpa-1.0.0:2.1-api
	>=dev-java/jandex-2.0.3:0
	>=dev-java/jboss-transaction-api-1.0.1:1.2_spec
	>=dev-java/antlr-2.7.7:0
	>=dev-java/classmate-1.5.1:0
	>=dev-java/dom4j-1.6.1:1
	>=dev-java/javassist-3.21.0:3
	>=dev-java/jboss-logging-3.4.0:0
	dev-java/byte-buddy:1.6
	dev-java/validation-api:0
	dev-java/cdi-api:1.2
	dev-java/javax-security-jacc-api:0
	dev-java/ant-core:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="antlr,classmate,dom4j-1,hibernate-commons-annotations,hibernate-jpa-2.1-api,javassist-3,jandex,jboss-logging,jboss-transaction-api-1.2_spec,byte-buddy-1.6,validation-api,cdi-api-1.2,javax-security-jacc-api,ant-core"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" \
		$(find org/hibernate -name "*.dtd") \
		$(find org/hibernate -name "*.properties") \
		$(find org/hibernate -name "*.xsd") || \
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}
