# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jasper-compiler-5.5.23.pom --download-uri https://repo1.maven.org/maven2/tomcat/jasper-compiler/5.5.23/jasper-compiler-5.5.23.jar --slot 0 --keywords "~amd64" --ebuild jasper-compiler-5.5.23.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="The Apache Software Foundation provides support for the Apache community of open-source software projects.
    The Apache projects are characterized by a collaborative, consensus based development process, an open and
    pragmatic software license, and a desire to create high quality software that leads the way in its field.
    We consider ourselves not simply a group of projects sharing a server, but rather a community of developers
    and users."
HOMEPAGE="http://tomcat.apache.org/jasper-compiler"
SRC_URI="https://repo1.maven.org/maven2/tomcat/${PN}/${PV}/${P}.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="tomcat:jasper-compiler:5.5.23"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ant:ant:1.6.5 -> >=dev-java/ant-core-1.10.7:0
# javax.servlet:jsp-api:2.0 -> >=java-virtuals/jsp-api-2.3:2.3

CDEPEND="
	>=dev-java/ant-core-1.10.7:0
	java-virtuals/jsp-api:2.3
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="ant-core,jsp-api-2.3"
JAVA_SRC_DIR="src/main/java"
