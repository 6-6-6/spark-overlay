# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.eclipse.persistence.moxy-3.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.moxy/3.0.0/org.eclipse.persistence.moxy-3.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.moxy/3.0.0/org.eclipse.persistence.moxy-3.0.0.jar --slot 0 --keywords "~amd64" --ebuild org-eclipse-persistence-moxy-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.eclipse.persistence:org.eclipse.persistence.moxy:3.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Comprehensive and universal persistence framework for Java."
HOMEPAGE="http://www.eclipse.org/eclipselink/moxy/org.eclipse.persistence.moxy"
SRC_URI="https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.moxy/${PV}/org.eclipse.persistence.moxy-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/eclipse/persistence/org.eclipse.persistence.moxy/${PV}/org.eclipse.persistence.moxy-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 EPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.moxy-${PV}.pom
# jakarta.validation:jakarta.validation-api:3.0.0 -> >=dev-java/jakarta-validation-api-3.0.0:0
# jakarta.ws.rs:jakarta.ws.rs-api:3.0.0 -> >=dev-java/jakarta-ws-rs-api-3.0.0:3
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0 -> >=dev-java/jakarta-xml-bind-api-3.0.0:0
# org.eclipse.persistence:org.eclipse.persistence.asm:3.0.0 -> >=dev-java/org-eclipse-persistence-asm-3.0.0:0
# org.eclipse.persistence:org.eclipse.persistence.core:3.0.0 -> >=dev-java/org-eclipse-persistence-core-3.0.0:0

CDEPEND="
	>=dev-java/jakarta-validation-api-3.0.0:0
	>=dev-java/jakarta-ws-rs-api-3.0.0:3
	>=dev-java/jakarta-xml-bind-api-3.0.0:0
	>=dev-java/org-eclipse-persistence-asm-3.0.0:0
	>=dev-java/org-eclipse-persistence-core-3.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.moxy-${PV}.pom
# com.sun.xml.bind:jaxb-xjc:3.0.0 -> >=dev-java/jaxb-xjc-3.0.0:0
# jakarta.activation:jakarta.activation-api:2.0.0 -> >=dev-java/jakarta-activation-api-2.0.0:0
# jakarta.mail:jakarta.mail-api:2.0.0 -> >=dev-java/jakarta-mail-api-2.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/jakarta-activation-api-2.0.0:0
		>=dev-java/jakarta-mail-api-2.0.0:0
		>=dev-java/jaxb-xjc-3.0.0:0
	)
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.moxy-${PV}.pom
# com.sun.activation:jakarta.activation:2.0.0 -> >=dev-java/jakarta-activation-2.0.0:0
# com.sun.mail:jakarta.mail:2.0.0 -> >=dev-java/jakarta-mail-2.0.0:0

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
	>=dev-java/jakarta-activation-2.0.0:0

	>=dev-java/jakarta-mail-2.0.0:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-validation-api,jakarta-ws-rs-api-3,jakarta-xml-bind-api,org-eclipse-persistence-asm,org-eclipse-persistence-core,jakarta-activation,jakarta-mail"
JAVA_CLASSPATH_EXTRA="jaxb-xjc,jakarta-activation-api,jakarta-mail-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
