# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/joda-time-2.9.7.pom --download-uri https://repo.maven.apache.org/maven2/joda-time/joda-time/2.9.7/joda-time-2.9.7-sources.jar --slot 0 --keywords "~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris" --ebuild joda-time-2.9.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MAVEN_ID="joda-time:joda-time:2.9.7"
DESCRIPTION="Date and time library to replace JDK date handling"
HOMEPAGE="http://www.joda.org/joda-time/"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.joda:joda-convert:1.2 -> >=dev-java/joda-convert-1.3.1:0

CDEPEND="
	>=dev-java/joda-convert-1.3.1:0
"

DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="joda-convert"
