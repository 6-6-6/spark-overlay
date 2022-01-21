# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/joda-timezones-2013d.pom --download-uri https://repo1.maven.org/maven2/org/jruby/joda-timezones/2013d/joda-timezones-2013d.jar --slot 0 --keywords "~amd64" --ebuild joda-timezones-2013.ebuild

EAPI=8

MAVEN_ID="org.jruby:joda-timezones:2013d"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Precompiled Timezone data for joda-time"
HOMEPAGE="https://github.com/jruby/joda-timezones"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}d/${P}d.jar -> ${P}.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}d.pom
# joda-time:joda-time:2.2 -> >=dev-java/joda-time-2.7:0

CDEPEND="
	>=dev-java/joda-time-2.7:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="joda-time"
