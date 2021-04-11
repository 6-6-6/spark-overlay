# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-core-1.19.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/sun/jersey/jersey-core/1.19/jersey-core-1.19-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/sun/jersey/jersey-core/1.19/jersey-core-1.19.jar --slot 0 --keywords "~amd64" --ebuild jersey-core-1.19.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.jersey:jersey-core:1.19"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jersey is the open source (under dual CDDL+GPL license) JAX-RS (JSR 311) production quality Reference Implementation for building RESTful Web services."
HOMEPAGE="https://jersey.java.net/jersey-core/"
SRC_URI="https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="CDDL-1.1 GPL-2-with-classpath-exception"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.ws.rs:jsr311-api:1.1.1 -> >=dev-java/jsr311-api-1.1.1:0

CDEPEND="
	>=dev-java/jsr311-api-1.1.1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# javax.mail:mail:1.4 -> >=dev-java/mail-1.4:0
# javax.xml.bind:jaxb-api:2.1 -> >=dev-java/jaxb-api-2.2:0
# org.osgi:org.osgi.core:4.2.0 -> >=dev-java/osgi-core-api-5.0.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/jaxb-api-2.2:0
		>=dev-java/mail-1.4:0
		>=dev-java/osgi-core-api-5.0.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr311-api"
JAVA_CLASSPATH_EXTRA="mail,jaxb-api,osgi-core-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
