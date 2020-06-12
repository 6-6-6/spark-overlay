# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/curator-framework-5.0.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/curator/curator-framework/5.0.0/curator-framework-5.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild curator-framework-5.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="High-level API that greatly simplifies using ZooKeeper."
HOMEPAGE="http://curator.apache.org/curator-framework"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/curator/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.curator:curator-framework:5.0.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.curator:curator-client:5.0.0 -> >=app-maven/curator-client-5.0.0:0

CDEPEND="
	>=app-maven/curator-client-5.0.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.fasterxml.jackson.core:jackson-core:2.10.0 -> >=dev-java/jackson-2.9.10:2
# com.fasterxml.jackson.core:jackson-databind:2.10.0 -> >=dev-java/jackson-databind-2.11.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/jackson-2.9.10:2
	>=dev-java/jackson-databind-2.11.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="curator-client"
JAVA_GENTOO_CLASSPATH_EXTRA="jackson-2,jackson-databind"
JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
