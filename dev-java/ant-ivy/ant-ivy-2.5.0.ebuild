# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/ivy-2.5.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/ivy/ivy/2.5.0/ivy-2.5.0-sources.jar --slot 0 --keywords "~amd64" --ebuild ivy-2.5.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Software Foundation provides support for the Apache community of open-source software projects.
    The Apache projects are characterized by a collaborative, consensus based development process, an open and
    pragmatic software license, and a desire to create high quality software that leads the way in its field.
    We consider ourselves not simply a group of projects sharing a server, but rather a community of developers
    and users."
HOMEPAGE="http://ant.apache.org/ivy/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/ivy/ivy/${PV}/ivy-${PV}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.ivy:ivy:2.5.0"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.jcraft:jsch:0.1.55 -> >=dev-java/jsch-0.1.52:0
# org.apache.ant:ant:1.9.14 -> >=dev-java/ant-core-1.10.7:0
# org.apache.commons:commons-vfs2:2.2 -> >=dev-java/commons-vfs-2.2:2
# org.apache.httpcomponents:httpclient:4.5.9 -> >=dev-java/httpcomponents-client-4.5:4.5
# oro:oro:2.0.8 -> !!!groupId-not-found!!!

CDEPEND="
	>=app-maven/oro-2.0.8:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/jsch-0.1.52:0
"
#	>=dev-java/commons-vfs-2.2:2


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsch,ant-core,httpcomponents-client-4.5,oro"
