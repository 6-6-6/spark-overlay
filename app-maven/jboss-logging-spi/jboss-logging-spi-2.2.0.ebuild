# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-logging-spi-2.2.0.CR1.pom --download-uri https://repo.maven.apache.org/maven2/org/jboss/logging/jboss-logging-spi/2.2.0.CR1/jboss-logging-spi-2.2.0.CR1-sources.jar --slot 0 --keywords "~amd64" --ebuild jboss-logging-spi-2.2.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The JBoss Logging Framework Programming Interface"
HOMEPAGE="http://www.jboss.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/jboss/logging/${PN}/${PV}.CR1/${P}.CR1-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.logging:jboss-logging-spi:2.2.0.CR1"



DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
"

S="${WORKDIR}"

