# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/java9-concurrent-backport-2.0.0.pom --download-uri https://repo1.maven.org/maven2/net/sourceforge/streamsupport/java9-concurrent-backport/2.0.0/java9-concurrent-backport-2.0.0-sources.jar --slot 0 --keywords "~amd64" --ebuild java9-concurrent-backport-2.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="net.sourceforge.streamsupport:java9-concurrent-backport:2.0.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Backport of Java 9 CompletableFuture, Flow and SubmissionPublisher API for Java 8"
HOMEPAGE="https://github.com/stefan-zobel/java9-concurrent-backport/"
SRC_URI="https://repo1.maven.org/maven2/net/sourceforge/streamsupport/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/net/sourceforge/streamsupport/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="GPL-2-with-classpath-exception"
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

JAVA_ENCODING="Cp1252"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
