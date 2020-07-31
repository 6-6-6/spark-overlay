# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/osgi_R4_core-1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/osgi/osgi_R4_core/1.0/osgi_R4_core-1.0.jar --slot 4 --keywords "~amd64" --ebuild osgi-core-bin-1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar


MY_PV="1.0"
DESCRIPTION="OSGi R4 core"
HOMEPAGE="http://www.osgi.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/osgi/osgi_R4_core/${MY_PV}/osgi_R4_core-${MY_PV}.jar -> ${P}.jar"
LICENSE=""
SLOT="4"
KEYWORDS="~amd64"
MAVEN_ID="org.osgi:osgi_R4_core:1.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

