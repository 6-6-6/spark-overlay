# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"
MAVEN_ID="javax.xml.rpc:javax.xml.rpc-api:${PV}"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java APIs for XML-based RPC"
HOMEPAGE="https://javaee.github.io/glassfish/"

SRC_URI="https://repo1.maven.org/maven2/javax/xml/rpc/javax.xml.rpc-api/${PV}/javax.xml.rpc-api-${PV}-sources.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="
	dev-java/jakarta-servlet-api:4
	dev-java/jakarta-xml-soap-api:1
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	${CP_DEPEND}
"

JAVA_SRC_DIR="src/main/java"
