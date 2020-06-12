# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-jexl-2.1.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-jexl/2.1.1/commons-jexl-2.1.1-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-jexl-2.1.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Commons Jexl library is an implementation of the JSTL Expression Language with extensions."
HOMEPAGE="http://commons.apache.org/jexl/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-jexl:2.1.1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0

CDEPEND="
	>=dev-java/commons-logging-1.2:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.bsf:bsf-api:3.1 -> >=dev-java/bsf-2.4.0:2.3

DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/bsf-2.4.0:2.3
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

JAVA_GENTOO_CLASSPATH="commons-logging"
JAVA_GENTOO_CLASSPATH_EXTRA="bsf-2.3"
JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
