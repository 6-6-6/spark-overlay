# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/netty-tcnative-2.0.26.Final.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/io/netty/netty-tcnative/2.0.26.Final/netty-tcnative-2.0.26.Final-sources.jar --binjar-uri https://repo1.maven.org/maven2/io/netty/netty-tcnative/2.0.26.Final/netty-tcnative-2.0.26.Final.jar --slot 0 --keywords "~amd64" --ebuild netty-tcnative-2.0.26.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="io.netty:netty-tcnative:2.0.26.Final"
DESCRIPTION="A Mavenized fork of Tomcat Native which incorporates various patches. This artifact is dynamically linked to OpenSSL and Apache APR."
HOMEPAGE="https://github.com/netty/netty-tcnative/netty-tcnative/"
SRC_URI="https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/io/netty/${PN}/${PV}.Final/${P}.Final.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
