# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/apache-rat-tasks-0.6.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/rat/apache-rat-tasks/0.6/apache-rat-tasks-0.6-sources.jar --slot 0 --keywords "~amd64" --ebuild apache-rat-tasks-0.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Ant tasks for running RAT"
HOMEPAGE="http://incubator.apache.org/rat/apache-rat-tasks"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/rat/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.rat:apache-rat-tasks:0.6"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.rat:apache-rat-core:0.6 -> >=app-maven/apache-rat-core-0.6:0

CDEPEND="
	>=app-maven/apache-rat-core-0.6:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.apache.ant:ant:1.7.1 -> >=dev-java/ant-core-1.10.7:0

DEPEND="
	>=virtual/jdk-1.4:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/ant-core-1.10.7:0
"

RDEPEND="
	>=virtual/jre-1.4:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="apache-rat-core"
JAVA_CLASSPATH_EXTRA="ant-core"
