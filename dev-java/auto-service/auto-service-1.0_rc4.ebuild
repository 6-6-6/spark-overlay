# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/auto-service-1.0-rc4.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/auto/service/auto-service/1.0-rc4/auto-service-1.0-rc4-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/auto/service/auto-service/1.0-rc4/auto-service-1.0-rc4.jar --slot 0 --keywords "~amd64" --ebuild auto-service-1.0_rc4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.auto.service:auto-service:1.0-rc4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Provider-configuration files for ServiceLoader."
HOMEPAGE="https://github.com/google/auto/auto-service"
SRC_URI="https://repo1.maven.org/maven2/com/google/auto/service/${PN}/1.0-rc4/${PN}-1.0-rc4-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/auto/service/${PN}/1.0-rc4/${PN}-1.0-rc4.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-1.0-rc4.pom
# com.google.auto:auto-common:0.8 -> >=dev-java/auto-common-0.8:0
# com.google.guava:guava:23.5-jre -> >=dev-java/guava-29.0:0

CDEPEND="
	>=dev-java/auto-common-0.8:0
	>=dev-java/guava-29.0:0
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

JAVA_GENTOO_CLASSPATH="auto-common,guava"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
