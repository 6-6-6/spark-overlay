# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/chill_2.12-0.9.3.pom --download-uri https://repo1.maven.org/maven2/com/twitter/chill_2.12/0.9.3/chill_2.12-0.9.3-sources.jar --slot 2.12 --keywords "~amd64" --ebuild chill-0.9.3-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.twitter:chill_2.12:0.9.3"

inherit java-pkg-2 java-pkg-simple java-pkg-maven java-pkg-simple-plugins

DESCRIPTION="Scala extensions for the Kryo serialization library"
HOMEPAGE="https://github.com/twitter/chill"
SRC_URI="
	https://repo1.maven.org/maven2/com/twitter/${PN}_2.12/${PV}/${PN}_2.12-${PV}-sources.jar -> ${P}-sources.jar
	binary? ( https://repo1.maven.org/maven2/com/twitter/${PN}_2.12/${PV}/${PN}_2.12-${PV}.jar -> ${P}-bin.jar )
"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}_2.12-${PV}.pom
# com.esotericsoftware:kryo-shaded:4.0.2 -> >=dev-java/kryo-shaded-4.0.2:0
# com.twitter:chill-java:0.9.3 -> >=dev-java/chill-java-0.9.3:0
# org.scala-lang:scala-library:2.12.6 -> >=dev-java/scala-common-bin-2.12.4:2.12

CDEPEND="
	>=dev-java/chill-java-0.9.3:0
	>=dev-java/kryo-shaded-4.0.2:0
"
#	>=dev-java/scala-common-bin-2.12.4:2.12

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? ( dev-lang/scala )
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="kryo-shaded,chill-java"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_compile() {
	sed -i "s/com.esotericsoftware.reflectasm.shaded.//"\
		${JAVA_SRC_DIR}/com/twitter/chill/ClosureCleaner.scala || die "sed failed"
	java-pkg-simple-plugins_src_compile
}
