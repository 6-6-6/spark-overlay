# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hibernate-validator-7.0.0.Alpha3.pom --download-uri https://repo.maven.apache.org/maven2/org/hibernate/validator/hibernate-validator/7.0.0.Alpha3/hibernate-validator-7.0.0.Alpha3-sources.jar --slot 0 --keywords "~amd64" --ebuild hibernate-validator-7.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Hibernate's Jakarta Bean Validation reference implementation."
HOMEPAGE="http://hibernate.org/validator/hibernate-validator"
SRC_URI="https://repo.maven.apache.org/maven2/org/hibernate/validator/${PN}/${PV}.Alpha3/${P}.Alpha3-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.hibernate.validator:hibernate-validator:7.0.0.Alpha3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha3.pom
# com.fasterxml:classmate:1.3.4 -> >=dev-java/classmate-1.5.1:0
# com.thoughtworks.paranamer:paranamer:2.8 -> >=app-maven/paranamer-2.8:0
# jakarta.persistence:jakarta.persistence-api:3.0.0-RC2 -> >=app-maven/jakarta-persistence-api-3.0.0:0
# jakarta.validation:jakarta.validation-api:3.0.0-M1 -> >=app-maven/jakarta-validation-api-3.0.0:0
# javax.money:money-api:1.0.1 -> >=app-maven/money-api-1.1:0
# joda-time:joda-time:2.9.7 -> >=dev-java/joda-time-2.10.6:0
# org.jboss.logging:jboss-logging:3.3.2.Final -> >=dev-java/jboss-logging-3.4.1:0
# org.jsoup:jsoup:1.8.3 -> >=dev-java/jsoup-1.8.3:0

CDEPEND="
	>=app-maven/jakarta-persistence-api-3.0.0:0
	>=app-maven/jakarta-validation-api-3.0.0:0
	>=app-maven/money-api-1.1:0
	>=app-maven/paranamer-2.8:0
	>=dev-java/classmate-1.5.1:0
	>=dev-java/jboss-logging-3.4.1:0
	>=dev-java/joda-time-2.10.6:0
	>=dev-java/jsoup-1.8.3:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha3.pom
# org.glassfish:jakarta.el:4.0.0-RC1 -> >=app-maven/jakarta-el-4.0.0:0
# org.jboss.logging:jboss-logging-annotations:2.1.0.Final -> >=app-maven/jboss-logging-annotations-2.2.1:0
# org.jboss.logging:jboss-logging-processor:2.1.0.Final -> >=app-maven/jboss-logging-processor-2.2.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jakarta-el-4.0.0:0
	>=app-maven/jboss-logging-annotations-2.2.1:0
	>=app-maven/jboss-logging-processor-2.2.1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="classmate,paranamer,jakarta-persistence-api,jakarta-validation-api,money-api,joda-time,jboss-logging,jsoup"
JAVA_CLASSPATH_EXTRA="jakarta-el,jboss-logging-annotations,jboss-logging-processor"
