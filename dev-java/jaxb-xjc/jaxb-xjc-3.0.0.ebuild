# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxb-xjc-3.0.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/xml/bind/mvn/jaxb-xjc/3.0.0-M4/jaxb-xjc-3.0.0-M4-sources.jar --slot 0 --keywords "~amd64" --ebuild jaxb-xjc-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Old JAXB Binding Compiler. Contains source code needed for binding customization files into java sources. In other words: the *tool* to generate java classes for the given xml representation."
HOMEPAGE="https://eclipse-ee4j.github.io/jaxb-ri/jaxb-bundles/jaxb-xjc"
SRC_URI="https://repo1.maven.org/maven2/com/sun/xml/bind/${PN}/${PV}-M4/${P}-M4-sources.jar"
LICENSE=""
SLOT="3.0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.xml.bind:jaxb-xjc:3.0.0-M4"
MAVEN_PROVIDE="org.glassfish.jaxb:jaxb-xjc:3.0.0-M4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# com.sun.xml.bind:jaxb-core:3.0.0-M4 -> dev-java/jaxb-core:${SLOT}

CDEPEND="
	dev-java/jaxb-core:${SLOT}
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M4.pom
# com.sun.istack:istack-commons-tools:4.0.0-M3 -> dev-java/istack-commons-tools
# com.sun.org.apache.xml.internal:resolver:20050927 -> !!!groupId-not-found!!!
# com.sun.xml.bind.external:relaxng-datatype:3.0.0-M4 -> !!!groupId-not-found!!!
# com.sun.xml.bind.external:rngom:3.0.0-M4 -> !!!groupId-not-found!!!
# com.sun.xml.dtd-parser:dtd-parser:1.4.3 -> !!!groupId-not-found!!!
# jakarta.activation:jakarta.activation-api:2.0.0-RC3 -> !!!groupId-not-found!!!
# org.apache.ant:ant:1.10.7 -> >=dev-java/ant-core-1.10.7:0
# org.glassfish.jaxb:codemodel:3.0.0-M4 -> !!!groupId-not-found!!!
# org.glassfish.jaxb:xsom:3.0.0-M4 -> !!!groupId-not-found!!!

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/codemodel-3.0.0:0
	>=app-maven/dtd-parser-1.4.3:0
	>=app-maven/jakarta-activation-api-2.0.0:0
	>=app-maven/relaxng-datatype-3.0.0:0
	>=app-maven/resolver-20050927:0
	>=app-maven/rngom-3.0.0:0
	>=app-maven/xsom-3.0.0:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/istack-commons-tools-4.0.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jaxb-core-3.0"
JAVA_GENTOO_CLASSPATH_EXTRA="istack-commons-tools,resolver,relaxng-datatype,rngom,dtd-parser,jakarta-activation-api,ant-core,codemodel,xsom"
