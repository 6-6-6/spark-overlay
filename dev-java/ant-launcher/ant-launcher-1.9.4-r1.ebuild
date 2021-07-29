# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/ant-launcher-1.9.4.pom --download-uri https://repo1.maven.org/maven2/org/apache/ant/ant-launcher/1.9.4/ant-launcher-1.9.4-sources.jar --slot 0 --keywords "~amd64" --ebuild ant-launcher-1.9.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.ant:ant-launcher:1.9.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Standalone Apache Ant Launcher package"
HOMEPAGE="https://ant.apache.org/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/ant/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/ant/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		dev-java/ant-core:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="ant-core"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
