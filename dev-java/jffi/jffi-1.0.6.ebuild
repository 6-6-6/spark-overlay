# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jffi-1.0.6.pom --download-uri https://repo1.maven.org/maven2/org/jruby/extras/jffi/1.0.6/jffi-1.0.6.jar --slot 0 --keywords "~amd64" --ebuild jffi-1.0.6.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Java wrapper around libffi"
HOMEPAGE="http://github.com/wmeissner/jffi"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/extras/${PN}/${PV}/${P}.jar"
LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby.extras:jffi:1.0.6"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
