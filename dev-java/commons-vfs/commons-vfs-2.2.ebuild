# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-vfs2-2.2.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-vfs2/2.2/commons-vfs2-2.2-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-vfs-2.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Commons VFS is a Virtual File System library."
HOMEPAGE="http://commons.apache.org/proper/commons-vfs/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${PN}2/${PV}/${PN}2-${PV}-sources.jar"
LICENSE=""
SLOT="2"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-vfs2:2.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}2-${PV}.pom
# ant:ant:1.6.5 -> >=dev-java/ant-core-1.10.7:0
# com.jcraft:jsch:0.1.54 -> >=dev-java/jsch-0.1.54:0
# commons-httpclient:commons-httpclient:3.1 -> >=dev-java/commons-httpclient-3.1:3
# commons-logging:commons-logging:1.2 -> >=dev-java/commons-logging-1.2:0
# commons-net:commons-net:3.6 -> >=dev-java/commons-net-3.6:0
# org.apache.commons:commons-collections4:4.1 -> >=dev-java/commons-collections-4.1:4
# org.apache.commons:commons-compress:1.14 -> >=dev-java/commons-compress-1.20:0
# org.apache.hadoop:hadoop-common:2.6.0 -> !!!groupId-not-found!!!
# org.apache.hadoop:hadoop-hdfs:2.6.0 -> !!!groupId-not-found!!!
# org.apache.jackrabbit:jackrabbit-webdav:1.6.5 -> >=dev-java/jackrabbit-webdav-2.10.1:0

CDEPEND="
	>=app-maven/hadoop-common-2.6.0
	>=app-maven/hadoop-hdfs-2.6.0

	>=dev-java/ant-core-1.10.7:0
	>=dev-java/commons-collections-4.1:4
	>=dev-java/commons-compress-1.20:0
	>=dev-java/commons-httpclient-3.1:3
	>=dev-java/commons-logging-1.2:0
	>=dev-java/commons-net-3.6:0
	>=dev-java/jackrabbit-webdav-2.10.1:0
	>=dev-java/jsch-0.1.54:0
"


DEPEND="
	>=virtual/jdk-1.7:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="ant-core,jsch,commons-httpclient-3,commons-logging,commons-net,commons-collections-4,commons-compress,hadoop-common,hadoop-hdfs,jackrabbit-webdav"
