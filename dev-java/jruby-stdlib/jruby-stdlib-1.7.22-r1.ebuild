# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jruby-stdlib-1.7.22.pom --download-uri https://repo1.maven.org/maven2/org/jruby/jruby-stdlib/1.7.22/jruby-stdlib-1.7.22-sources.jar --slot 0 --keywords "~amd64" --ebuild jruby-stdlib-1.7.22-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JRuby is the effort to recreate the Ruby (http://www.ruby-lang.org) interpreter in Java."
HOMEPAGE="https://github.com/jruby/jruby/jruby-artifacts/jruby-stdlib"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby:jruby-stdlib:1.7.22"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="utf-8"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

