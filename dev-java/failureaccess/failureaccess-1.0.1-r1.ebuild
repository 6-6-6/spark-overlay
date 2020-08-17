# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/failureaccess-1.0.1.pom --download-uri https://repo1.maven.org/maven2/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild failureaccess-1.0.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.guava:failureaccess:1.0.1"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Contains com.google.common.util.concurrent.internal.InternalFutureFailureAccess and InternalFutures. Most users will never need to use this artifact. Its classes is conceptually a part of Guava, but they're in this separate artifact so that Android libraries can use them without pulling in all of Guava (just as they can use ListenableFuture by depending on the listenablefuture artifact)."
HOMEPAGE="https://github.com/google/guava/failureaccess"
SRC_URI="https://repo1.maven.org/maven2/com/google/guava/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/guava/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
