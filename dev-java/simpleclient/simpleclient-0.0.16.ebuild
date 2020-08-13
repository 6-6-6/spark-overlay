# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/simpleclient-0.0.16.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/io/prometheus/simpleclient/0.0.16/simpleclient-0.0.16-sources.jar --binjar-uri https://repo1.maven.org/maven2/io/prometheus/simpleclient/0.0.16/simpleclient-0.0.16.jar --slot 0 --keywords "~amd64" --ebuild simpleclient-0.0.16.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="io.prometheus:simpleclient:0.0.16"
DESCRIPTION="Core instrumentation library for the simpleclient."
HOMEPAGE="http://github.com/prometheus/client_java/simpleclient"
SRC_URI="https://repo1.maven.org/maven2/io/prometheus/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/io/prometheus/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
