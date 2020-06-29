# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/constantine-0.7.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/extras/constantine/0.7/constantine-0.7.jar --slot 0 --keywords "~amd64" --ebuild constantine-0.7.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="A set of platform constants (e.g. errno values)"
HOMEPAGE="http://constantine.kenai.com"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/extras/${PN}/${PV}/${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby.extras:constantine:0.7"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

