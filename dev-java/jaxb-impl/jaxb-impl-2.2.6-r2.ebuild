# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="com.sun.xml.bind:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JAXB (JSR 222) reference implementation"
HOMEPAGE="https://javaee.github.io/jaxb-v2/"
SRC_URI="
	https://repo1.maven.org/maven2/com/sun/xml/bind/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/xml/bind/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="|| ( CDDL-1.1 GPL-2-with-classpath-exception )"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/ant-core:0
	dev-java/args4j:2
	dev-java/codemodel:2
	dev-java/fastinfoset:0
	dev-java/jakarta-activation:2
	dev-java/jaxb-api:2
	dev-java/junit:4
	dev-java/rngom:0
	dev-java/stax-ex:1
	dev-java/wsdl4j:0
	dev-java/xsom:0
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

JAVA_NEEDS_TOOLS=1
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_RESOURCE_DIRS=(
	"src/main/resources"
)

JAVADOC_ARGS="-source 8"
