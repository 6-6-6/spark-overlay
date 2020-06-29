# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-annotations-2.7.4.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-annotations/2.7.4/hadoop-annotations-2.7.4-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-annotations-2.7.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Annotations"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-annotations:2.7.4"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jdiff:jdiff:1.0.9 -> >=app-maven/jdiff-1.0.9:0

DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
	>=app-maven/jdiff-1.0.9:0
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="jdiff"
