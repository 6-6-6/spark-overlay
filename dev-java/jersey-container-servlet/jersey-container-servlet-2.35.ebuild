# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# This package does not have a test suite
JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.glassfish.jersey.containers:${PN}:${PV}"

inherit java-pkg-2 java-pkg-simple

MY_PN="jersey"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Jersey core Servlet 3.x implementation"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jersey"
# Need the JAR from Maven Central for source file
# org/glassfish/jersey/servlet/init/internal/LocalizationMessages.java
SRC_URI="
	https://github.com/eclipse-ee4j/jersey/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz
	https://repo1.maven.org/maven2/org/glassfish/jersey/containers/${PN}/${PV}/${P}-sources.jar
"
LICENSE="|| ( EPL-2.0 GPL-2-with-classpath-exception )"
SLOT="2"
KEYWORDS="~amd64"

CP_DEPEND="
	~dev-java/jersey-container-servlet-core-${PV}:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	dev-java/jakarta-servlet-api:0
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}/${MY_P}/containers/${PN/container-}"

JAVA_CLASSPATH_EXTRA="jakarta-servlet-api"
JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS=( "src/main/resources" )

src_prepare() {
	cp "${WORKDIR}/org/glassfish/jersey/servlet/init/internal/LocalizationMessages.java" \
		"${JAVA_SRC_DIR}" || die "Failed to copy extra Java source file"
	java-pkg-2_src_prepare
}
