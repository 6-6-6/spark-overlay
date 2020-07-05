# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spark-kvstore_2.12-3.0.0-preview2.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/spark/spark-kvstore_2.12/3.0.0-preview2/spark-kvstore_2.12-3.0.0-preview2-sources.jar --slot 2.12 --keywords "~amd64" --ebuild spark-kvstore-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The Apache Software Foundation provides support for the Apache community of open-source software projects.
    The Apache projects are characterized by a collaborative, consensus based development process, an open and
    pragmatic software license, and a desire to create high quality software that leads the way in its field.
    We consider ourselves not simply a group of projects sharing a server, but rather a community of developers
    and users."
HOMEPAGE="http://spark.apache.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="2.12"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.spark:spark-kvstore_2.12:3.0.0-preview2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.fasterxml.jackson.core:jackson-annotations:2.10.0 -> >=dev-java/jackson-annotations-2.11.0:2
# com.fasterxml.jackson.core:jackson-core:2.10.0 -> >=dev-java/jackson-2.11.0:2
# com.fasterxml.jackson.core:jackson-databind:2.10.0 -> >=app-maven/jackson-databind-2.10.0:0
# org.apache.spark:spark-tags_2.12:3.0.0-preview2 -> >=app-maven/spark-tags-3.0.0:2.12
# org.fusesource.leveldbjni:leveldbjni-all:1.8 -> >=dev-java/leveldbjni-all-1.8:0
# org.spark-project.spark:unused:1.0.0 -> >=app-maven/unused-1.0.0:0

CDEPEND="
	>=app-maven/jackson-databind-2.10.0:0
	>=app-maven/spark-tags-3.0.0:2.12
	>=app-maven/unused-1.0.0:0
	>=dev-java/jackson-2.11.0:2
	>=dev-java/jackson-annotations-2.11.0:2
	>=dev-java/leveldbjni-all-1.8:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# com.google.guava:guava:14.0.1 -> >=dev-java/guava-29.0:0

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/guava-29.0:0
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jackson-annotations-2,jackson-2,jackson-databind,spark-tags-2.12,leveldbjni-all,unused"
JAVA_CLASSPATH_EXTRA="guava"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
