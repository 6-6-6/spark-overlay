# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/osgi_R4_core-1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/osgi/osgi_R4_core/1.0/osgi_R4_core-1.0.jar --slot 4 --keywords "~amd64" --ebuild osgi-core-bin-1.0.ebuild

EAPI=8

MAVEN_ID="org.osgi:osgi_R4_core:1.0"

inherit java-pkg-2 java-pkg-binjar

MY_PV="1.0"
DESCRIPTION="OSGi R4 core"
HOMEPAGE="https://www.osgi.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/osgi/osgi_R4_core/${MY_PV}/osgi_R4_core-${MY_PV}.jar -> ${P}.jar"
LICENSE="Apache-2.0"
SLOT="4"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
