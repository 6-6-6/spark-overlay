# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/npn-boot-8.1.2.v20120308.pom --download-uri https://repo.maven.apache.org/maven2/org/mortbay/jetty/npn/npn-boot/8.1.2.v20120308/npn-boot-8.1.2.v20120308-sources.jar --slot 0 --keywords "~amd64" --ebuild npn-boot-8.1.2_p20120308.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty integrations and distributions"
HOMEPAGE="http://www.eclipse.org/jetty/jetty-parent/jetty-integration-project/npn-parent/npn-boot"
SRC_URI="https://repo.maven.apache.org/maven2/org/mortbay/jetty/npn/${PN}/8.1.2.v20120308/${PN}-8.1.2.v20120308-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.mortbay.jetty.npn:npn-boot:8.1.2.v20120308"



DEPEND="
	>=virtual/jdk-1.7:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.7:*
"

S="${WORKDIR}"

