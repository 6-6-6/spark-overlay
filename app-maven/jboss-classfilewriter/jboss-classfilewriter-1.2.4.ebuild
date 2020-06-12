# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-classfilewriter-1.2.4.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/classfilewriter/jboss-classfilewriter/1.2.4.Final/jboss-classfilewriter-1.2.4.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-classfilewriter-1.2.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A bytecode writer that creates .class files at runtime"
HOMEPAGE="https://github.com/jbossas/jboss-classfilewriter"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/classfilewriter/${PN}/${PV}.Final/${P}.Final-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.classfilewriter:jboss-classfilewriter:1.2.4.Final"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

