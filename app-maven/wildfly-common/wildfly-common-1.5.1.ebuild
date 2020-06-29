# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/wildfly-common-1.5.1.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/wildfly/common/wildfly-common/1.5.1.Final/wildfly-common-1.5.1.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild wildfly-common-1.5.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Provides, via submodules, a base configuration for JBoss project builds, as well as a derived configuration supporting multi-release JARs"
HOMEPAGE="http://www.jboss.org/wildfly-common"
SRC_URI="https://repo.maven.apache.org/maven2/org/wildfly/common/${PN}/${PV}.Final/${P}.Final-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.wildfly.common:wildfly-common:1.5.1.Final"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# org.jboss.logging:jboss-logging:3.4.0.Final -> >=dev-java/jboss-logging-3.4.1:0

CDEPEND="
	>=dev-java/jboss-logging-3.4.1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.Final.pom
# com.oracle.substratevm:svm:1.0.0-rc9 -> >=dev-java/svm-19.2.1:0
# javax.annotation:javax.annotation-api:1.3 -> >=dev-java/jsr250-1.3.2:0
# org.graalvm.sdk:graal-sdk:1.0.0-rc9 -> >=app-maven/graal-sdk-19.2.1:0
# org.jboss.logging:jboss-logging-annotations:2.2.0.Final -> >=app-maven/jboss-logging-annotations-2.2.0:0
# org.jboss.logging:jboss-logging-processor:2.2.0.Final -> >=app-maven/jboss-logging-processor-2.2.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/graal-sdk-19.2.1:0
	>=app-maven/jboss-logging-annotations-2.2.0:0
	>=app-maven/jboss-logging-processor-2.2.0:0
	>=dev-java/jsr250-1.3.2:0
	>=dev-java/svm-19.2.1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jboss-logging"
JAVA_CLASSPATH_EXTRA="svm,jsr250,graal-sdk,jboss-logging-annotations,jboss-logging-processor"
