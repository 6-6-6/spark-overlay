# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jasper-runtime-5.5.23.pom --download-uri https://repo.maven.apache.org/maven2/tomcat/jasper-runtime/5.5.23/jasper-runtime-5.5.23.jar --slot 0 --keywords "~amd64" --ebuild jasper-runtime-5.5.23.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="The Apache Software Foundation provides support for the Apache community of open-source software projects.
    The Apache projects are characterized by a collaborative, consensus based development process, an open and
    pragmatic software license, and a desire to create high quality software that leads the way in its field.
    We consider ourselves not simply a group of projects sharing a server, but rather a community of developers
    and users."
HOMEPAGE="http://tomcat.apache.org/jasper-runtime"
SRC_URI="https://repo.maven.apache.org/maven2/tomcat/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="tomcat:jasper-runtime:5.5.23"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-el:commons-el:1.0 -> >=dev-java/commons-el-1.0:0
# javax.servlet:servlet-api:2.4 -> >=java-virtuals/servlet-api-4.0:4.0

CDEPEND="
	>=dev-java/commons-el-1.0:0
	>=java-virtuals/servlet-api-4.0:4.0
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

JAVA_GENTOO_CLASSPATH="commons-el,servlet-api-4.0"
JAVA_SRC_DIR="src/main/java"
