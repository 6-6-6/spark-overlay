# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jsf-api-2.0.pom --download-uri https://repo1.maven.org/maven2/javax/faces/jsf-api/2.0/jsf-api-2.0-sources.jar --slot 0 --keywords "~amd64" --ebuild jsf-api-2.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.faces:jsf-api:2.0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="This is the master POM file for Sun's Implementation of the JSF 2.0 Specification."
HOMEPAGE="http://java.sun.com/javaee/javaserverfaces/"
SRC_URI="https://repo1.maven.org/maven2/javax/faces/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/javax/faces/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="CDDL GPL-1"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.el:el-api:1.0 -> java-virtuals/el-api:3.0
# javax.servlet:servlet-api:2.5 -> java-virtuals/servlet-api:4.0
# javax.servlet.jsp:jsp-api:2.1 -> java-virtuals/jsp-api:2.3
# jstl:jstl:1.2 -> >=dev-java/jstl-1.2:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	>=dev-java/jstl-1.2:0
	java-virtuals/el-api:3.0
	java-virtuals/jsp-api:2.3
	java-virtuals/servlet-api:4.0
	dev-java/validation-api:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="el-api-3.0,servlet-api-4.0,jsp-api-2.3,jstl,validation-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
