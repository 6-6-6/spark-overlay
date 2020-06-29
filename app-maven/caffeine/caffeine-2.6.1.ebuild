# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/caffeine-2.6.1.pom --download-uri https://repo.maven.apache.org/maven2/com/github/ben-manes/caffeine/caffeine/2.6.1/caffeine-2.6.1-sources.jar --slot 0 --keywords "~amd64" --ebuild caffeine-2.6.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A high performance caching library for Java 8+"
HOMEPAGE="https://github.com/ben-manes/caffeine"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/ben-manes/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.github.ben-manes.caffeine:caffeine:2.6.1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:jsr305:3.0.2 -> >=dev-java/jsr305-3.0.2:0
# com.google.errorprone:error_prone_annotations:2.1.3 -> >=dev-java/error-prone-annotations-2.4.0:prone_annotations

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=dev-java/error-prone-annotations-2.4.0:prone_annotations
	>=dev-java/jsr305-3.0.2:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jsr305,error-prone-annotations-prone_annotations"
