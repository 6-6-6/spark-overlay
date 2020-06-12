# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/joda-timezones-2019c.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/joda-timezones/2019c/joda-timezones-2019c.jar --slot 0 --keywords "~amd64" --ebuild joda-timezones-bin-2019.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/joda-timezones"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/joda-timezones/${PV}c/joda-timezones-${PV}c.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby:joda-timezones:2020"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/joda-timezones-${PV}c.pom
# joda-time:joda-time:2.10.5 -> >=dev-java/joda-time-2.7:0

CDEPEND="
	>=dev-java/joda-time-2.7:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="joda-time"
