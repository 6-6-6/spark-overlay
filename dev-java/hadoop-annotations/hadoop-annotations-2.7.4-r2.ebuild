# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-annotations-2.7.4.pom --download-uri https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-annotations/2.7.4/hadoop-annotations-2.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-annotations-2.7.4-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.hadoop:hadoop-annotations:2.7.4"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Apache Hadoop Annotations"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jdiff:jdiff:1.0.9 -> >=dev-java/jdiff-1.0.9:0

# Depends on com.sun.tools.doclets.standard.Standard.validOptions(),
# which is no longer available on Java 11
DEPEND="
	virtual/jdk:1.8
	app-arch/unzip
	!binary? (
		>=dev-java/jdiff-1.0.9:0
	)
"

RDEPEND="
	virtual/jre:1.8
"

S="${WORKDIR}"

JAVA_NEEDS_TOOLS=1
JAVA_CLASSPATH_EXTRA="jdiff"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
