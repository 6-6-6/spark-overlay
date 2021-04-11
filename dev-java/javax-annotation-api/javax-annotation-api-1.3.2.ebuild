# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.annotation-api-1.3.2.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/javax/annotation/javax.annotation-api/1.3.2/javax.annotation-api-1.3.2-sources.jar --binjar-uri https://repo1.maven.org/maven2/javax/annotation/javax.annotation-api/1.3.2/javax.annotation-api-1.3.2.jar --slot 0 --keywords "~amd64" --ebuild javax-annotation-api-1.3.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="javax.annotation:javax.annotation-api:1.3.2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Common Annotations for the JavaTM Platform API"
HOMEPAGE="http://jcp.org/en/jsr/detail?id=250"
SRC_URI="https://repo1.maven.org/maven2/javax/annotation/javax.annotation-api/${PV}/javax.annotation-api-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/javax/annotation/javax.annotation-api/${PV}/javax.annotation-api-${PV}.jar -> ${P}-bin.jar"
LICENSE="CDDL GPL-2-with-classpath-exception"
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
