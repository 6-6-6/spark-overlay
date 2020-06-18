# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/reactive-streams-1.0.3.pom --download-uri https://repo.maven.apache.org/maven2/org/reactivestreams/reactive-streams/1.0.3/reactive-streams-1.0.3-sources.jar --slot 0 --keywords "~amd64" --ebuild reactive-streams-1.0.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A Protocol for Asynchronous Non-Blocking Data Sequence"
HOMEPAGE="http://www.reactive-streams.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/reactivestreams/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.reactivestreams:reactive-streams:1.0.3"


# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# concurrent:concurrent:0 -> !!!groupId-not-found!!!

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	app-maven/concurrent
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="concurrent"
