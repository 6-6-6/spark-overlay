# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/reactor-core-3.3.6.RELEASE.pom --download-uri https://repo.maven.apache.org/maven2/io/projectreactor/reactor-core/3.3.6.RELEASE/reactor-core-3.3.6.RELEASE-sources.jar --slot 0 --keywords "~amd64" --ebuild reactor-core-3.3.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Non-Blocking Reactive Foundation for the JVM"
HOMEPAGE="https://github.com/reactor/reactor-core"
SRC_URI="https://repo.maven.apache.org/maven2/io/projectreactor/${PN}/${PV}.RELEASE/${P}.RELEASE-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="io.projectreactor:reactor-core:3.3.6.RELEASE"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.RELEASE.pom
# org.reactivestreams:reactive-streams:1.0.3 -> >=app-maven/reactive-streams-1.0.3:0

CDEPEND="
	>=app-maven/reactive-streams-1.0.3:0
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

JAVA_GENTOO_CLASSPATH="reactive-streams"
