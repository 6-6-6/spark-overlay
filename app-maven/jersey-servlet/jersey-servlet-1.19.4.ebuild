# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-servlet-1.19.4.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/jersey/jersey-servlet/1.19.4/jersey-servlet-1.19.4-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-servlet-1.19.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jersey is the open source (under dual CDDL+GPL license) JAX-RS (JSR 311)
        production quality Reference Implementation for building
        RESTful Web services."
HOMEPAGE="https://jersey.java.net/jersey-servlet/"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/jersey/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.jersey:jersey-servlet:1.19.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.sun.jersey:jersey-server:1.19.4 -> >=app-maven/jersey-server-1.19.4:0

CDEPEND="
	>=app-maven/jersey-server-1.19.4:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# ant:ant:1.6.5 -> >=dev-java/ant-core-1.10.7:0
# javax.persistence:persistence-api:1.0 -> >=app-maven/persistence-api-1.0.2:0
# javax.servlet:javax.servlet-api:3.0.1 -> >=java-virtuals/servlet-api-2.3:2.3
# javax.servlet:jsp-api:2.0 -> >=app-maven/jsp-api-bin-2.0:0
# org.glassfish:javax.ejb:3.1 -> >=java-virtuals/ejb-api-0:0
# org.jboss.weld:weld-osgi-bundle:1.1.32.Final -> >=app-maven/weld-osgi-bundle-4.0.0:0
# org.osgi:osgi_R4_core:1.0 -> >=app-maven/osgi-core-bin-1.0:4

DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
	>=app-maven/jsp-api-bin-2.0:0
	>=app-maven/osgi-core-bin-1.0:4
	>=app-maven/persistence-api-1.0.2:0
	>=app-maven/weld-osgi-bundle-4.0.0:0
	>=dev-java/ant-core-1.10.7:0
	>=java-virtuals/ejb-api-0:0
	>=java-virtuals/servlet-api-2.3:2.3
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jersey-server"
JAVA_GENTOO_CLASSPATH_EXTRA="ant-core,persistence-api,servlet-api-2.3,jsp-api-bin,ejb-api,weld-osgi-bundle,osgi-core-bin-4"
