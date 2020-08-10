# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hibernate-validator-6.0.10.Final.pom --download-uri https://repo1.maven.org/maven2/org/hibernate/validator/hibernate-validator/6.0.10.Final/hibernate-validator-6.0.10.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild hibernate-validator-6.0.10-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.hibernate.validator:hibernate-validator:6.0.10.Final"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Hibernate's Bean Validation (JSR-380) reference implementation."
HOMEPAGE="http://hibernate.org/validator/hibernate-validator"
SRC_URI="https://repo1.maven.org/maven2/org/hibernate/validator/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/hibernate/validator/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.fasterxml:classmate:1.3.4 -> >=dev-java/classmate-1.5.1:0
# com.thoughtworks.paranamer:paranamer:2.8 -> >=dev-java/paranamer-2.8:0
# javax.money:money-api:1.0.1 -> >=dev-java/money-api-1.0.1:0
# javax.validation:validation-api:2.0.1.Final -> >=dev-java/validation-api-2.0.1:0
# joda-time:joda-time:2.9.7 -> >=dev-java/joda-time-2.9.7:0
# org.hibernate.javax.persistence:hibernate-jpa-2.1-api:1.0.2.Final -> >=dev-java/hibernate-jpa-1.0.2:2.1-api
# org.jboss.logging:jboss-logging:3.3.2.Final -> >=dev-java/jboss-logging-3.4.0:0
# org.jsoup:jsoup:1.8.3 -> >=dev-java/jsoup-1.8.3:0

CDEPEND="
	>=dev-java/hibernate-jpa-1.0.2:2.1-api
	>=dev-java/money-api-1.0.1:0
	>=dev-java/paranamer-2.8:0
	>=dev-java/classmate-1.5.1:0
	>=dev-java/jboss-logging-3.4.0:0
	>=dev-java/joda-time-2.9.7:0
	>=dev-java/jsoup-1.8.3:0
	>=dev-java/validation-api-2.0.1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.glassfish:javax.el:3.0.1-b09 -> >=dev-java/javax-el-3.0.1_beta09:0
# org.jboss.logging:jboss-logging-annotations:2.1.0.Final -> >=dev-java/jboss-logging-annotations-2.1.0:0
# org.jboss.logging:jboss-logging-processor:2.1.0.Final -> >=dev-java/jboss-logging-processor-2.1.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/javax-el-3.0.1_beta09:0
	>=dev-java/jboss-logging-annotations-2.1.0:0
	>=dev-java/jboss-logging-processor-2.1.0:0
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

JAVA_GENTOO_CLASSPATH="classmate,paranamer,money-api,validation-api,joda-time,hibernate-jpa-2.1-api,jboss-logging,jsoup"
JAVA_CLASSPATH_EXTRA="javax-el,jboss-logging-annotations,jboss-logging-processor"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
