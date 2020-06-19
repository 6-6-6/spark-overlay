# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/avro-ipc-jetty-1.9.2.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/avro/avro-ipc-jetty/1.9.2/avro-ipc-jetty-1.9.2-sources.jar --slot 0 --keywords "~amd64" --ebuild avro-ipc-jetty-1.9.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Avro inter-process communication components using Jetty"
HOMEPAGE="https://avro.apache.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/avro/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.avro:avro-ipc-jetty:1.9.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.avro:avro:1.9.2 -> >=app-maven/avro-1.9.2:0
# org.apache.avro:avro-ipc:1.9.2 -> >=app-maven/avro-ipc-1.9.2:0
# org.eclipse.jetty:jetty-server:9.4.25.v20191220 -> >=app-maven/jetty-server-9.4.28_p20200408:0
# org.eclipse.jetty:jetty-servlet:9.4.25.v20191220 -> >=app-maven/jetty-servlet-9.4.25_p20191220:0
# org.eclipse.jetty:jetty-util:9.4.25.v20191220 -> >=app-maven/jetty-util-9.4.28_p20200408:0
# org.slf4j:slf4j-api:1.7.25 -> >=dev-java/slf4j-api-2.0.0_alpha1:0

CDEPEND="
	>=app-maven/avro-1.9.2:0
	>=app-maven/avro-ipc-1.9.2:0
	>=app-maven/jetty-server-9.4.28_p20200408:0
	>=app-maven/jetty-servlet-9.4.25_p20191220:0
	>=app-maven/jetty-util-9.4.28_p20200408:0
	>=dev-java/slf4j-api-2.0.0_alpha1:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="avro,avro-ipc,jetty-server,jetty-servlet,jetty-util,slf4j-api"
