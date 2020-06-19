# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jline-3.0.0.M1.pom --download-uri https://repo.maven.apache.org/maven2/jline/jline/3.0.0.M1/jline-3.0.0.M1-sources.jar --slot 0 --keywords "~amd64" --ebuild jline-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/jline"
SRC_URI="https://repo.maven.apache.org/maven2/${PN}/${PN}/${PV}.M1/${P}.M1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="jline:jline:3.0.0.M1"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.M1.pom
# com.googlecode.juniversalchardet:juniversalchardet:1.0.3 -> >=app-maven/juniversalchardet-1.0.3:0
# net.java.dev.jna:jna:4.0.0 -> >=dev-java/jna-5.5.0:0
# org.fusesource.jansi:jansi:1.12 -> >=dev-java/jansi-1.12

CDEPEND="
	>=app-maven/juniversalchardet-1.0.3:0
	>=dev-java/jansi-1.12
	>=dev-java/jna-5.5.0:5
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

JAVA_GENTOO_CLASSPATH="juniversalchardet,jna-5,jansi"
