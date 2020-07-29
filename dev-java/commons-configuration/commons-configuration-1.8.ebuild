# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-configuration-1.8.pom --download-uri https://repo.maven.apache.org/maven2/commons-configuration/commons-configuration/1.8/commons-configuration-1.8-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-configuration-1.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Tools to assist in the reading of configuration/preferences files in various formats"
HOMEPAGE="http://commons.apache.org/configuration/"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="0"
KEYWORDS="amd64 ppc64 x86"
MAVEN_ID="commons-configuration:commons-configuration:1.8"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-beanutils:commons-beanutils:1.8.3 -> >=dev-java/commons-beanutils-1.9.2:1.7
# commons-codec:commons-codec:1.5 -> >=dev-java/commons-codec-1.7:0
# commons-collections:commons-collections:3.2.1 -> >=dev-java/commons-collections-3.2.1:0
# commons-digester:commons-digester:1.8.1 -> >=dev-java/commons-digester-1.8.1:0
# commons-jxpath:commons-jxpath:1.3 -> >=dev-java/commons-jxpath-1.3:0
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# log4j:log4j:1.2.8 -> >=dev-java/log4j-1.2.17:0
# org.apache.commons:commons-jexl:2.1.1 -> >=dev-java/commons-jexl-2.1.1:2
# org.apache.commons:commons-vfs2:2.0 -> >=dev-java/commons-vfs-2.0:2
# xml-resolver:xml-resolver:1.2 -> >=dev-java/xml-resolver-1.2:0

CDEPEND="
	>=dev-java/xml-resolver-1.2:0
	>=dev-java/commons-beanutils-1.9.2:1.7
	>=dev-java/commons-codec-1.7:0
	>=dev-java/commons-collections-3.2.1:0
	>=dev-java/commons-digester-1.8.1:0
	>=dev-java/commons-jexl-2.1.1:2
	>=dev-java/commons-jxpath-1.3:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/commons-logging-1.2:0
	>=dev-java/commons-vfs-2.0:2
	>=dev-java/log4j-1.2.17:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.servlet:servlet-api:2.4 -> >=java-virtuals/servlet-api-4.0:4.0
# xml-apis:xml-apis:1.0.b2 -> >=dev-java/xml-apis-1.0:0

DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/xml-apis-1.0:0
	java-virtuals/servlet-api:4.0
	)
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

JAVA_GENTOO_CLASSPATH="commons-beanutils-1.7,commons-codec,commons-collections,commons-digester,commons-jxpath,commons-lang-2.1,commons-logging,log4j,commons-jexl-2,commons-vfs-2,xml-resolver"
JAVA_CLASSPATH_EXTRA="servlet-api-4.0,xml-apis"
JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=(
	"src/main/resources"
)
JAVA_BINJAR_FILENAME="${P}-bin.jar"
