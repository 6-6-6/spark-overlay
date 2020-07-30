# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-server-1.9.pom --download-uri https://repo1.maven.org/maven2/com/sun/jersey/jersey-server/1.9/jersey-server-1.9-sources.jar --slot 1 --keywords "~amd64" --ebuild jersey-server-1.9-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jersey is the open source (under dual CDDL+GPL license) JAX-RS (JSR 311)
        production quality Reference Implementation for building
        RESTful Web services."
HOMEPAGE="https://jersey.java.net/jersey-server/"
SRC_URI="https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="1"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.jersey:jersey-server:1.9"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# asm:asm:3.1 -> >=dev-java/asm-8.0.1:4
# com.sun.jersey:jersey-core:1.9 -> >=dev-java/jersey-core-1.9:1

CDEPEND="
	>=dev-java/jersey-core-1.9:1
	>=dev-java/asm-3.1:3
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ant:ant:1.6.5 -> >=dev-java/ant-core-1.10.7:0
# javax.mail:mail:1.4 -> >=dev-java/mail-1.4:0
# javax.persistence:persistence-api:1.0 -> >=dev-java/persistence-api-1.0:0
# javax.servlet:javax.servlet-api:3.0.1 -> java-virtuals/servlet-api:4.0
# javax.servlet:jsp-api:2.0 -> java-virtuals/jsp-api:2.3
# javax.xml.bind:jaxb-api:2.1 -> >=dev-java/jaxb-api-2.2:0
# org.glassfish:javax.ejb:3.1 -> java-virtuals/ejb-api:0
# org.jboss.weld:weld-osgi-bundle:1.1.0.Final -> >=dev-java/weld-osgi-bundle-1.1.0:0
# org.osgi:osgi_R4_core:1.0 -> >=dev-java/osgi-core-4.0:4

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/jaxb-api-2.2:0
	>=dev-java/mail-1.4:0
	>=dev-java/persistence-api-1.0:0
	>=dev-java/weld-osgi-bundle-1.1.0:0
	>=dev-java/ant-core-1.10.7:0
	>=dev-java/osgi-core-4.0:4
	java-virtuals/ejb-api:0
	java-virtuals/jsp-api:2.3
	java-virtuals/servlet-api:4.0
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="asm-3,jersey-core-1"
JAVA_CLASSPATH_EXTRA="ant-core,mail,persistence-api,servlet-api-4.0,jsp-api-2.3,jaxb-api,ejb,weld-osgi-bundle,osgi-core-4"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

