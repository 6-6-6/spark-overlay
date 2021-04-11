# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-json-1.19.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/sun/jersey/jersey-json/1.19/jersey-json-1.19-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/sun/jersey/jersey-json/1.19/jersey-json-1.19.jar --slot 0 --keywords "~amd64" --ebuild jersey-json-1.19.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.jersey:jersey-json:1.19"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jersey is the open source (under dual CDDL+GPL license) JAX-RS (JSR 311) production quality Reference Implementation for building RESTful Web services."
HOMEPAGE="https://jersey.java.net/jersey-json/"
SRC_URI="https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="CDDL-1.1 GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.sun.jersey:jersey-core:1.19 -> >=dev-java/jersey-core-1.19:0
# com.sun.xml.bind:jaxb-impl:2.2.3-1 -> >=dev-java/jaxb-impl-2.2.3.1:0
# org.codehaus.jackson:jackson-core-asl:1.9.2 -> >=dev-java/jackson-core-asl-1.9.13:0
# org.codehaus.jackson:jackson-jaxrs:1.9.2 -> >=dev-java/jackson-jaxrs-1.9.13:0
# org.codehaus.jackson:jackson-mapper-asl:1.9.2 -> >=dev-java/jackson-mapper-asl-1.9.13:0
# org.codehaus.jackson:jackson-xc:1.9.2 -> >=dev-java/jackson-xc-1.9.13:0
# org.codehaus.jettison:jettison:1.1 -> >=dev-java/jettison-1.3.7:0
# org.eclipse.persistence:org.eclipse.persistence.moxy:2.3.2 -> >=dev-java/org-eclipse-persistence-moxy-3.0.0:0

CDEPEND="
	>=dev-java/jackson-core-asl-1.9.13:0
	>=dev-java/jackson-jaxrs-1.9.13:0
	>=dev-java/jackson-mapper-asl-1.9.13:0
	>=dev-java/jackson-xc-1.9.13:0
	>=dev-java/jaxb-impl-2.2.3.1:0
	>=dev-java/jersey-core-1.19:0
	>=dev-java/jettison-1.3.7:0
	>=dev-java/org-eclipse-persistence-moxy-3.0.0:0
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

JAVA_GENTOO_CLASSPATH="jersey-core,jaxb-impl,jackson-core-asl,jackson-jaxrs,jackson-mapper-asl,jackson-xc,jettison,org-eclipse-persistence-moxy"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
