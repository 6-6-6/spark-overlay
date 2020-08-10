# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jruby-complete-1.7.22.pom --download-uri https://repo1.maven.org/maven2/org/jruby/jruby-complete/1.7.22/jruby-complete-1.7.22-sources.jar --slot 0 --keywords "~amd64" --ebuild jruby-complete-1.7.22-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.jruby:jruby-complete:1.7.22"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JRuby is the effort to recreate the Ruby (http://www.ruby-lang.org) interpreter in Java."
HOMEPAGE="https://github.com/jruby/jruby/jruby-artifacts/jruby-complete"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/jruby/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="LGPL-3 EPL-1.0 GPL-3"
SLOT="0"
KEYWORDS="~amd64"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby:jruby-core:1.7.22 -> >=dev-java/jruby-core-1.7.22:0
# org.jruby:jruby-stdlib:1.7.22 -> >=dev-java/jruby-stdlib-1.7.22:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
	>=dev-java/jruby-core-1.7.22:0
	>=dev-java/jruby-stdlib-1.7.22:0
	)
	test? (
		amd64? (
			dev-util/japi-compliance-checker
			dev-util/pkgdiff
		)
	)"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="utf-8"

JAVA_CLASSPATH_EXTRA="jruby-core,jruby-stdlib"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
JAVA_TESTING_FRAMEWORKS="pkgdiff"
