# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jruby-1.7.22.pom --download-uri https://repo1.maven.org/maven2/org/jruby/jruby/1.7.22/jruby-1.7.22-sources.jar --slot 0 --keywords "~amd64" --ebuild jruby-1.7.22-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jruby:jruby:1.7.22"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JRuby is the effort to recreate the Ruby (http://www.ruby-lang.org) interpreter in Java."
HOMEPAGE="https://github.com/jruby/jruby/jruby-artifacts/jruby"
SRC_URI="https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="EPL-1.0 GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby:jruby-core:1.7.22 -> >=dev-java/jruby-core-1.7.22:0
# org.jruby:jruby-stdlib:1.7.22 -> >=dev-java/jruby-stdlib-1.7.22:0

CDEPEND="
	>=dev-java/jruby-core-1.7.22:0
	>=dev-java/jruby-stdlib-1.7.22:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="utf-8"

JAVA_GENTOO_CLASSPATH="jruby-core,jruby-stdlib"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
