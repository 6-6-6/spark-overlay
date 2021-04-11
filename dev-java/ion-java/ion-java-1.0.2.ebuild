# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/ion-java-1.0.2.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/software/amazon/ion/ion-java/1.0.2/ion-java-1.0.2-sources.jar --binjar-uri https://repo1.maven.org/maven2/software/amazon/ion/ion-java/1.0.2/ion-java-1.0.2.jar --slot 0 --keywords "~amd64" --ebuild ion-java-1.0.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="software.amazon.ion:ion-java:1.0.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A Java implementation of the Amazon Ion data notation."
HOMEPAGE="https://github.com/amznlabs/ion-java/"
SRC_URI="https://repo1.maven.org/maven2/software/amazon/ion/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/software/amazon/ion/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
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

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
