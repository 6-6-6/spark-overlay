# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jersey-client-1.9.pom --download-uri https://repo1.maven.org/maven2/com/sun/jersey/jersey-client/1.9/jersey-client-1.9-sources.jar --slot 1 --keywords "~amd64" --ebuild jersey-client-1.9-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.sun.jersey:jersey-client:1.9"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jersey is the open source (under dual CDDL+GPL license) JAX-RS (JSR 311) production quality Reference Implementation for building RESTful Web services."
HOMEPAGE="https://jersey.java.net/jersey-client/"
SRC_URI="https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/sun/jersey/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="CDDL-1.1 GPL-2-with-classpath-exception"
SLOT="1"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.sun.jersey:jersey-core:1.9 -> >=dev-java/jersey-core-1.9:1

CDEPEND="
	>=dev-java/jersey-core-1.9:1
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:osgi_R4_core:1.0 -> >=dev-java/osgi-core-4.0:4

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/osgi-core-4.0:4
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jersey-core-1"
JAVA_CLASSPATH_EXTRA="osgi-core-4"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
