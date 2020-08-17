# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/spark-tags_2.12-3.0.0-preview2.pom --download-uri https://repo1.maven.org/maven2/org/apache/spark/spark-tags_2.12/3.0.0-preview2/spark-tags_2.12-3.0.0-preview2-sources.jar --slot 2.12 --keywords "~amd64" --ebuild spark-tags-3.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.spark:spark-tags_2.12:3.0.0-preview2"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Apache Software Foundation provides support for the Apache community of open-source software projects. The Apache projects are characterized by a collaborative, consensus based development process, an open and pragmatic software license, and a desire to create high quality software that leads the way in its field. We consider ourselves not simply a group of projects sharing a server, but rather a community of developers and users."
HOMEPAGE="http://spark.apache.org/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/spark/${PN}_2.12/${PV}-preview2/${PN}_2.12-${PV}-preview2.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}-preview2.pom
# org.scala-lang:scala-library:2.12.10 -> >=dev-java/scala-common-bin-2.12.4:2.12
# org.spark-project.spark:unused:1.0.0 -> >=dev-java/unused-1.0.0:0

CDEPEND="
	>=dev-java/unused-1.0.0:0
	>=dev-java/scala-common-bin-2.12.4:2.12
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="scala-common-bin-2.12,unused"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
