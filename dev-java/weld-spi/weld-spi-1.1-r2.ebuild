# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jboss.weld:${PN}:${PV}.Final"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="APIs for Weld, the reference implementation of JSR 299"
HOMEPAGE="https://weld.cdi-spec.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/weld/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# japi-compliance-checker fails
RESTRICT="test"

CP_DEPEND="
	>=dev-java/jboss-ejb-api-1.0.0:3.1_spec
	>=dev-java/jboss-interceptors-api-1.0.0:1.1_spec
	>=dev-java/jsf-api-2.0:0
	>=dev-java/jta-1.1:0
	>=dev-java/persistence-api-1.0:0
	>=dev-java/weld-api-1.1:0
	>=dev-java/cdi-api-1.2:1.2
	dev-java/jakarta-annotation-api:0
	>=dev-java/validation-api-1.1.0:1.0
	java-virtuals/servlet-api:4.0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
