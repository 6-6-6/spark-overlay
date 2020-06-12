# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-vfs2-2.6.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-vfs2/2.6.0/commons-vfs2-2.6.0-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-vfs2-2.6.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN=${PN}2

DESCRIPTION="Apache Commons VFS is a Virtual File System library."
HOMEPAGE="http://commons.apache.org/proper/commons-vfs/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${MY_PN}/${PV}/${MY_PN}-${PV}-sources.jar"
LICENSE=""
SLOT="2"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-vfs2:2.6.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ant:ant:1.6.5 -> >=dev-java/ant-core-1.10.7:0
# com.jcraft:jsch:0.1.55 -> >=dev-java/jsch-0.1.52:0
# commons-httpclient:commons-httpclient:3.1 -> >=dev-java/commons-httpclient-3.1:3
# commons-logging:commons-logging:1.2 -> >=dev-java/commons-logging-1.2:0
# commons-net:commons-net:3.6 -> >=dev-java/commons-net-3.2:0
# org.apache.commons:commons-collections4:4.4 -> >=dev-java/commons-collections-4.4:4
# org.apache.commons:commons-compress:1.19 -> >=dev-java/commons-compress-1.20:0
# org.apache.hadoop:hadoop-common:3.2.1 -> !!!groupId-not-found!!!
# org.apache.hadoop:hadoop-hdfs:3.2.1 -> !!!groupId-not-found!!!
# org.apache.hadoop:hadoop-hdfs-client:3.2.1 -> !!!groupId-not-found!!!
# org.apache.httpcomponents:httpclient:4.5.10 -> >=dev-java/httpcomponents-client-4.5:4.5
# org.apache.httpcomponents.client5:httpclient5:5.0-beta6 -> !!!groupId-not-found!!!

CDEPEND="
	>=app-maven/hadoop-common-3.2.1:0
	>=app-maven/hadoop-hdfs-3.2.1:0
	>=app-maven/hadoop-hdfs-client-3.2.1:0
	>=app-maven/httpclient5-5.0:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/commons-collections-4.4:4
	>=dev-java/commons-compress-1.20:0
	>=dev-java/commons-httpclient-3.1:3
	>=dev-java/commons-logging-1.2:0
	>=dev-java/commons-net-3.2:0
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/jsch-0.1.52:0
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

JAVA_GENTOO_CLASSPATH="ant-core,jsch,commons-httpclient-3,commons-logging,commons-net,commons-collections-4,commons-compress,hadoop-common,hadoop-hdfs,hadoop-hdfs-client,httpcomponents-client-4.5,httpclient5"
