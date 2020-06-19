# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.eclipse.persistence.core-3.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/persistence/org.eclipse.persistence.core/3.0.0-M1/org.eclipse.persistence.core-3.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild org-eclipse-persistence-core-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="TBD"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/org.eclipse.persistence.parent/foundation/org.eclipse.persistence.core"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/persistence/org.eclipse.persistence.core/${PV}-M1/org.eclipse.persistence.core-${PV}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.persistence:org.eclipse.persistence.core:3.0.0-M1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.core-${PV}-M1.pom
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> >=app-maven/jakarta-activation-api-2.0.0:0
# jakarta.enterprise:jakarta.enterprise.cdi-api:3.0.0-M2 -> >=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
# jakarta.jms:jakarta.jms-api:3.0.0-RC1 -> >=app-maven/jakarta-jms-api-3.0.0:0
# jakarta.json:jakarta.json-api:2.0.0-RC2 -> >=app-maven/jakarta-json-api-2.0.0:0
# jakarta.mail:jakarta.mail-api:2.0.0-RC4 -> >=app-maven/jakarta-mail-api-2.0.0:0
# jakarta.persistence:jakarta.persistence-api:3.0.0-RC2 -> >=app-maven/jakarta-persistence-api-3.0.0:0
# jakarta.resource:jakarta.resource-api:2.0.0-RC1 -> >=app-maven/jakarta-resource-api-2.0.0:0
# jakarta.transaction:jakarta.transaction-api:2.0.0-RC1 -> >=app-maven/jakarta-transaction-api-2.0.0:0
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0-RC3 -> >=app-maven/jakarta-xml-bind-api-3.0.0:0
# org.eclipse.persistence:org.eclipse.persistence.asm:3.0.0-M1 -> >=app-maven/org-eclipse-persistence-asm-3.0.0:0
# org.eclipse.persistence:org.eclipse.persistence.jpa.jpql:3.0.0-M1 -> >=app-maven/org-eclipse-persistence-jpa-jpql-3.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/jakarta-activation-api-2.0.0:0
	>=app-maven/jakarta-enterprise-cdi-api-3.0.0:0
	>=app-maven/jakarta-jms-api-3.0.0:0
	>=app-maven/jakarta-json-api-2.0.0:0
	>=app-maven/jakarta-mail-api-2.0.0:0
	>=app-maven/jakarta-persistence-api-3.0.0:0
	>=app-maven/jakarta-resource-api-2.0.0:0
	>=app-maven/jakarta-transaction-api-2.0.0:0
	>=app-maven/jakarta-xml-bind-api-3.0.0:0
	>=app-maven/org-eclipse-persistence-asm-3.0.0:0
	>=app-maven/org-eclipse-persistence-jpa-jpql-3.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-activation-api,jakarta-enterprise-cdi-api,jakarta-jms-api,jakarta-json-api,jakarta-mail-api,jakarta-persistence-api,jakarta-resource-api,jakarta-transaction-api,jakarta-xml-bind-api,org-eclipse-persistence-asm,org-eclipse-persistence-jpa-jpql"
