# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jakarta.servlet-api-4.0.3.pom --download-uri https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/4.0.3/jakarta.servlet-api-4.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild jakarta-servlet-api-4.0.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="jakarta.servlet:jakarta.servlet-api:4.0.3"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Eclipse Enterprise for Java (EE4J) is an open source initiative to create standard APIs, implementations of those APIs, and technology compatibility kits for Java runtimes that enable development, deployment, and management of server-side and cloud-native applications."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.servlet"
SRC_URI="https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/${PV}/jakarta.servlet-api-${PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/${PV}/jakarta.servlet-api-${PV}.jar -> ${P}-bin.jar"
LICENSE="EPL-2.0 GPL-2-with-classpath-exception"
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
