# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.annotation-api-1.3.5.pom --download-uri https://repo1.maven.org/maven2/jakarta/annotation/jakarta.annotation-api/1.3.5/jakarta.annotation-api-1.3.5-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-annotation-api-1.3.5-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="jakarta.annotation:jakarta.annotation-api:1.3.5"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Jakarta Annotations API"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.ca"
SRC_URI="https://repo1.maven.org/maven2/jakarta/annotation/jakarta.annotation-api/${PV}/jakarta.annotation-api-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/jakarta/annotation/jakarta.annotation-api/${PV}/jakarta.annotation-api-${PV}.jar -> ${P}-bin.jar"
LICENSE="GPL-2-with-classpath-exception EPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

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
