# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.eclipse.persistence.moxy-3.0.0-M1.pom --download-uri https://repo.maven.apache.org/maven2/org/eclipse/persistence/org.eclipse.persistence.moxy/3.0.0-M1/org.eclipse.persistence.moxy-3.0.0-M1-sources.jar --slot 0 --keywords "~amd64" --ebuild org-eclipse-persistence-moxy-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="TBD"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j/org.eclipse.persistence.parent/moxy/org.eclipse.persistence.moxy"
SRC_URI="https://repo.maven.apache.org/maven2/org/eclipse/persistence/org.eclipse.persistence.moxy/${PV}-M1/org.eclipse.persistence.moxy-${PV}-M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.eclipse.persistence:org.eclipse.persistence.moxy:3.0.0-M1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.moxy-${PV}-M1.pom
# jakarta.validation:jakarta.validation-api:3.0.0-M1 -> >=app-maven/jakarta-validation-api-3.0.0:0
# jakarta.ws.rs:jakarta.ws.rs-api:3.0.0-M1 -> >=app-maven/jakarta-ws-rs-api-3.0.0:0
# jakarta.xml.bind:jakarta.xml.bind-api:3.0.0-RC3 -> >=app-maven/jakarta-xml-bind-api-3.0.0:0
# org.eclipse.persistence:org.eclipse.persistence.asm:3.0.0-M1 -> >=app-maven/org-eclipse-persistence-asm-3.0.0:0
# org.eclipse.persistence:org.eclipse.persistence.core:3.0.0-M1 -> >=app-maven/org-eclipse-persistence-core-3.0.0:0

CDEPEND="
	>=app-maven/jakarta-validation-api-3.0.0:0
	>=app-maven/jakarta-ws-rs-api-3.0.0:0
	>=app-maven/jakarta-xml-bind-api-3.0.0:0
	>=app-maven/org-eclipse-persistence-asm-3.0.0:0
	>=app-maven/org-eclipse-persistence-core-3.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.moxy-${PV}-M1.pom
# com.sun.xml.bind:jaxb-xjc:3.0.0-M2 -> >=dev-java/jaxb-xjc-3.0.0:3.0
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> >=app-maven/jakarta-activation-api-2.0.0:0
# jakarta.mail:jakarta.mail-api:2.0.0-RC4 -> >=app-maven/jakarta-mail-api-2.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jakarta-activation-api-2.0.0:0
	>=app-maven/jakarta-mail-api-2.0.0:0
	>=dev-java/jaxb-xjc-3.0.0:3.0
"

# Runtime dependencies
# POM: /var/lib/java-ebuilder/poms/org.eclipse.persistence.moxy-${PV}-M1.pom
# com.sun.activation:jakarta.activation:2.0.0-RC3 -> >=app-maven/jakarta-activation-2.0.0:0
# com.sun.mail:jakarta.mail:2.0.0-RC4 -> >=app-maven/jakarta-mail-2.0.0:0
RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}
	>=app-maven/jakarta-activation-2.0.0:0

	>=app-maven/jakarta-mail-2.0.0:0
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-validation-api,jakarta-ws-rs-api,jakarta-xml-bind-api,org-eclipse-persistence-asm,org-eclipse-persistence-core,jakarta-activation,jakarta-mail"
JAVA_GENTOO_CLASSPATH_EXTRA="jaxb-xjc-3.0,jakarta-activation-api,jakarta-mail-api"
