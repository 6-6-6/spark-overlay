# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-modules-1.10.1.Final.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/modules/jboss-modules/1.10.1.Final/jboss-modules-1.10.1.Final-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-modules-1.10.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Provides, via submodules, a base configuration for JBoss project builds, as well as a derived configuration supporting multi-release JARs"
HOMEPAGE="http://www.jboss.org/jboss-modules"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/modules/${PN}/${PV}.Final/${P}.Final-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.modules:jboss-modules:1.10.1.Final"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

