# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxb-impl-2.2.3-1.pom --download-uri https://repo1.maven.org/maven2/com/sun/xml/bind/jaxb-impl/2.2.3-1/jaxb-impl-2.2.3-1-sources.jar --slot 0 --keywords "~amd64" --ebuild jaxb-impl-2.2.3.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="com.sun.xml.bind:jaxb-impl:2.2.6"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JAXB (JSR 222) reference implementation"
HOMEPAGE="http://jaxb.java.net/"
SRC_URI="https://repo1.maven.org/maven2/com/sun/xml/bind/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/xml/bind/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="GPL-2-with-classpath-exception CDDL-1.1"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-2.2.3-1.pom
# javax.xml.bind:jaxb-api:2.2.2 -> >=dev-java/jaxb-api-2.2.2:0

CDEPEND="
	>=dev-java/jaxb-api-2.2.2:0
	dev-java/codemodel:2
	dev-java/junit:4
	dev-java/xsom:0
	>=dev-java/rngom-20160500:0
	dev-java/wsdl4j:0
	dev-java/stax-ex:1
	dev-java/fastinfoset:0
	dev-java/ant-core:0
	dev-java/args4j:2
	dev-java/jakarta-activation:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_GENTOO_CLASSPATH="jaxb-api,codemodel-2,junit-4,xsom,rngom,wsdl4j,stax-ex-1,fastinfoset,ant-core,args4j-2,jakarta-activation"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_RESOURCE_DIRS=(
	"src/main/resources"
)
