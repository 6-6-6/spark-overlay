# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-logmanager-2.3.0.Alpha1.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/logmanager/jboss-logmanager/2.3.0.Alpha1/jboss-logmanager-2.3.0.Alpha1-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-logmanager-2.3.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="An implementation of java.util.logging.LogManager"
HOMEPAGE="http://www.jboss.org/jboss-logmanager"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/logmanager/${PN}/${PV}.Alpha1/${P}.Alpha1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.logmanager:jboss-logmanager:2.3.0.Alpha1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha1.pom
# jakarta.json:jakarta.json-api:2.0.0-RC2 -> !!!artifactId-not-found!!!
# org.glassfish:jakarta.json:2.0.0-RC2 -> !!!artifactId-not-found!!!
# org.wildfly.common:wildfly-common:1.5.1.Final -> !!!artifactId-not-found!!!

CDEPEND="
	>=app-maven/jakarta-json-2.0.0:0
	>=app-maven/jakarta-json-api-2.0.0:0
	>=app-maven/wildfly-common-1.5.1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Alpha1.pom
# org.jboss.modules:jboss-modules:1.10.1.Final -> >=dev-java/jboss-modules-1.10.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/jboss-modules-1.10.1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jakarta-json-api,jakarta-json,wildfly-common"
JAVA_CLASSPATH_EXTRA="jboss-modules"
