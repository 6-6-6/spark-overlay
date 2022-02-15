# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.jboss.logging:${PN}:${PV}.Final"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The JBoss Logging Framework"
HOMEPAGE="https://www.jboss.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/logging/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	>=dev-java/log4j-api-2.3:2
	>=dev-java/jboss-logmanager-1.5.2:0
	>=dev-java/log4j-1.2.17:0
	>=dev-java/slf4j-api-1.7.7:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="log4j,log4j-api-2,jboss-logmanager,slf4j-api"
JAVA_SRC_DIR="src/main/java"
