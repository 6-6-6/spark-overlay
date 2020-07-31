# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/joda-timezones-2013d.pom --download-uri https://repo1.maven.org/maven2/org/jruby/joda-timezones/2013d/joda-timezones-2013d.jar --slot 0 --keywords "~amd64" --ebuild joda-timezones-2013.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/joda-timezones"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}d/${P}d.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby:joda-timezones:2013d"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}d.pom
# joda-time:joda-time:2.2 -> >=dev-java/joda-time-2.7:0

CDEPEND="
	>=dev-java/joda-time-2.7:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="joda-time"
JAVA_SRC_DIR="src/main/java"
