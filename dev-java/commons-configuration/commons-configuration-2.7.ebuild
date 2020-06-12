# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-configuration2-2.7.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-configuration2/2.7/commons-configuration2-2.7-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-configuration2-2.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN=${PN}2

DESCRIPTION="Tools to assist in the reading of configuration/preferences files in
        various formats"
HOMEPAGE="https://commons.apache.org/proper/commons-configuration/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${MY_PN}/${PV}/${MY_PN}-${PV}-sources.jar"
LICENSE=""
SLOT="2"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-configuration2:2.7"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-databind:2.10.3 -> >=dev-java/jackson-databind-2.11.0:0
# commons-beanutils:commons-beanutils:1.9.4 -> >=dev-java/commons-beanutils-1.9.2:1.7
# commons-codec:commons-codec:1.14 -> >=dev-java/commons-codec-1.7:0
# commons-jxpath:commons-jxpath:1.3 -> >=dev-java/commons-jxpath-1.3:0
# commons-logging:commons-logging:1.2 -> >=dev-java/commons-logging-1.2:0
# log4j:log4j:1.2.17 -> >=dev-java/log4j-1.2.17:0
# org.apache.commons:commons-jexl:2.1.1 -> >=dev-java/commons-jexl-2.1.1:0
# org.apache.commons:commons-lang3:3.9 -> >=dev-java/commons-lang-3.10:3
# org.apache.commons:commons-text:1.8 -> >=dev-java/commons-text-1.8:0
# org.apache.commons:commons-vfs2:2.6.0 -> >=dev-java/commons-vfs-2.6.0:2
# org.springframework:spring-beans:4.3.26.RELEASE -> !!!groupId-not-found!!!
# org.springframework:spring-core:4.3.26.RELEASE -> !!!groupId-not-found!!!
# org.yaml:snakeyaml:1.26 -> >=dev-java/snakeyaml-1.16:0
# xml-resolver:xml-resolver:1.2 -> !!!groupId-not-found!!!

CDEPEND="
	>=app-maven/spring-beans-5.2.6:0
	>=app-maven/spring-core-5.2.6:0
	>=app-maven/xml-resolver-1.2:0

	>=dev-java/commons-jexl-2.1.1:0
	>=dev-java/commons-lang-3.10:3
	>=dev-java/commons-text-1.8:0
	>=dev-java/commons-vfs-2.6.0:2
	>=dev-java/commons-beanutils-1.9.2:1.7
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-jxpath-1.3:0
	>=dev-java/commons-logging-1.2:0
	>=dev-java/jackson-databind-2.11.0:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/snakeyaml-1.16:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:servlet-api:2.4 -> >=java-virtuals/servlet-api-2.3:2.3

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=java-virtuals/servlet-api-2.3:2.3
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

JAVA_GENTOO_CLASSPATH="jackson-databind,commons-beanutils-1.7,commons-codec,commons-jxpath,commons-logging,log4j,commons-jexl,commons-lang-3,commons-text,commons-vfs-2,spring-beans,spring-core,snakeyaml,xml-resolver"
JAVA_GENTOO_CLASSPATH_EXTRA="servlet-api-2.3"
JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
