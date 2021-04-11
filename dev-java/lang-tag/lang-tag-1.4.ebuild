# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/lang-tag-1.4.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/nimbusds/lang-tag/1.4/lang-tag-1.4-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/nimbusds/lang-tag/1.4/lang-tag-1.4.jar --slot 0 --keywords "~amd64" --ebuild lang-tag-1.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.nimbusds:lang-tag:1.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Java implementation of \"Tags for Identifying Languages\" 		(RFC 5646)."
HOMEPAGE="https://bitbucket.org/nimbusds/nimbus-langtag"
SRC_URI="https://repo1.maven.org/maven2/com/nimbusds/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/nimbusds/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# net.minidev:json-smart:1.1.1 -> >=dev-java/json-smart-1.3.1:0

CDEPEND="
	>=dev-java/json-smart-1.3.1:0
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

JAVA_GENTOO_CLASSPATH="json-smart"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
