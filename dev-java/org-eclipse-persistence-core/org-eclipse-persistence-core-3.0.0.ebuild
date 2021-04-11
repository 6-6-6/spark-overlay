# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.eclipse.persistence.core-3.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.core/3.0.0/org.eclipse.persistence.core-3.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.core/3.0.0/org.eclipse.persistence.core-3.0.0.jar --slot 0 --keywords "~amd64" --ebuild org-eclipse-persistence-core-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.eclipse.persistence:org.eclipse.persistence.core:3.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Comprehensive and universal persistence framework for Java."
HOMEPAGE="http://www.eclipse.org/eclipselink/foundation/org.eclipse.persistence.core"
SRC_URI="https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.core/${PV}/org.eclipse.persistence.core-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.core/${PV}/org.eclipse.persistence.core-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 EPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.core-${PV}.pom
# jakarta.activation:jakarta.activation-api:2.0.0 -> >=dev-java/jakarta-activation-api-2.0.0:0
# jakarta.enterprise:jakarta.enterprise.cdi-api:3.0.0 -> >=dev-java/jakarta-enterprise-cdi-api-3.0.0.1:0
# jakarta.jms:jakarta.jms-api:3.0.0 -> >=dev-java/jakarta-jms-api-3.0.0:0
# jakarta.json:jakarta.json-api:2.0.0 -> >=dev-java/jakarta-json-api-2.0.0:0
# jakarta.mail:jakarta.mail-api:2.0.0 -> >=dev-java/jakarta-mail-api-2.0.0:0
# jakarta.persistence:jakarta.persistence-api:3.0.0 -> >=dev-java/jakarta-persistence-api-3.0.0:0
# jakarta.resource:jakarta.resource-api:2.0.0 -> >=dev-java/jakarta-resource-api-2.0.0:0
# jakarta.transaction:jakarta.transaction-api:2.0.0 -> >=dev-java/jakarta-transaction-api-2.0.0:2
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0 -> >=dev-java/jakarta-xml-bind-api-3.0.0:0
# org.eclipse.persistence:org.eclipse.persistence.asm:3.0.0 -> >=dev-java/org-eclipse-persistence-asm-3.0.0:0
# org.eclipse.persistence:org.eclipse.persistence.jpa.jpql:3.0.0 -> >=dev-java/org-eclipse-persistence-jpa-jpql-3.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		>=dev-java/jakarta-activation-api-2.0.0:0
		>=dev-java/jakarta-enterprise-cdi-api-3.0.0.1:0
		>=dev-java/jakarta-jms-api-3.0.0:0
		>=dev-java/jakarta-json-api-2.0.0:0
		>=dev-java/jakarta-mail-api-2.0.0:0
		>=dev-java/jakarta-persistence-api-3.0.0:0
		>=dev-java/jakarta-resource-api-2.0.0:0
		>=dev-java/jakarta-transaction-api-2.0.0:2
		>=dev-java/jakarta-xml-bind-api-3.0.0:0
		>=dev-java/org-eclipse-persistence-asm-3.0.0:0
		>=dev-java/org-eclipse-persistence-jpa-jpql-3.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jakarta-activation-api,jakarta-enterprise-cdi-api,jakarta-jms-api,jakarta-json-api,jakarta-mail-api,jakarta-persistence-api,jakarta-resource-api,jakarta-transaction-api-2,jakarta-xml-bind-api,org-eclipse-persistence-asm,org-eclipse-persistence-jpa-jpql"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
