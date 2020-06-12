# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-json-1.19.4.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/jersey/jersey-json/1.19.4/jersey-json-1.19.4-sources.jar --slot 0 --keywords "~amd64" --ebuild jersey-json-1.19.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jersey is the open source (under dual CDDL+GPL license) JAX-RS (JSR 311)
        production quality Reference Implementation for building
        RESTful Web services."
HOMEPAGE="https://jersey.java.net/jersey-json/"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/jersey/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.jersey:jersey-json:1.19.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.sun.jersey:jersey-core:1.19.4 -> >=app-maven/jersey-core-1.19.4:0
# com.sun.xml.bind:jaxb-impl:2.2.3-1 -> >=dev-java/jaxb-impl-3.0.0:3.0
# org.codehaus.jackson:jackson-core-asl:1.9.2 -> >=app-maven/jackson-core-asl-1.9.11:0
# org.codehaus.jackson:jackson-jaxrs:1.9.2 -> >=app-maven/jackson-jaxrs-1.9.11:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.2 -> >=app-maven/jackson-mapper-asl-1.9.11:0
# org.codehaus.jackson:jackson-xc:1.9.2 -> >=app-maven/jackson-xc-1.9.11:0
# org.codehaus.jettison:jettison:1.1 -> >=dev-java/jettison-1.3.7:0
# org.eclipse.persistence:org.eclipse.persistence.moxy:2.3.4-M6 -> >=app-maven/org-eclipse-persistence-moxy-3.0.0:0

CDEPEND="
	>=app-maven/jackson-core-asl-1.9.11:0
	>=app-maven/jackson-jaxrs-1.9.11:0
	>=app-maven/jackson-mapper-asl-1.9.11:0
	>=app-maven/jackson-xc-1.9.11:0
	>=app-maven/jersey-core-1.19.4:0
	>=app-maven/org-eclipse-persistence-moxy-3.0.0:0
	>=dev-java/jaxb-impl-3.0.0:3.0
	>=dev-java/jettison-1.3.7:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jersey-core,jaxb-impl-3.0,jackson-core-asl,jackson-jaxrs,jackson-mapper-asl,jackson-xc,jettison,org-eclipse-persistence-moxy"
