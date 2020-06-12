# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/hadoop-annotations-3.2.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/hadoop/hadoop-annotations/3.2.1/hadoop-annotations-3.2.1-sources.jar --slot 0 --keywords "~amd64" --ebuild hadoop-annotations-3.2.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Apache Hadoop Annotations"
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/hadoop/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.hadoop:hadoop-annotations:3.2.1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# jdiff:jdiff:1.0.9 -> >=app-maven/jdiff-bin-1.0.9:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/jdiff-bin-1.0.9:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH_EXTRA="jdiff-bin"
