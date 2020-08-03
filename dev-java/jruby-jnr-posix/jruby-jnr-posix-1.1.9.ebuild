# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-posix-1.1.9.pom --download-uri https://repo1.maven.org/maven2/org/jruby/ext/posix/jnr-posix/1.1.9/jnr-posix-1.1.9.jar --slot 0 --keywords "~amd64" --ebuild jnr-posix-1.1.9.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.jruby.ext.posix:jnr-posix:1.1.9"

inherit java-pkg-2 java-pkg-binjar

MY_PN="jnr-posix"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Common cross-project/cross-platform POSIX APIs"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/ext/posix/${MY_PN}/${PV}/${MY_P}.jar -> ${P}.jar"
LICENSE="GPL-2 CPL-1.0 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby.extras:constantine:0.7 -> >=dev-java/constantine-0.7:0
# org.jruby.extras:jaffl:0.5.11 -> >=dev-java/jaffl-0.5.11:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=dev-java/jaffl-0.5.11:0
	>=dev-java/constantine-0.7:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="constantine,jaffl"
JAVA_SRC_DIR="src/main/java"
