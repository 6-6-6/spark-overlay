# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jruby-complete-9.2.11.1.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/jruby-complete/9.2.11.1/jruby-complete-9.2.11.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jruby-complete-9.2.11.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JRuby is the effort to recreate the Ruby (https://www.ruby-lang.org) interpreter in Java."
HOMEPAGE="https://github.com/jruby/jruby/jruby-artifacts/jruby-complete"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby:jruby-complete:9.2.11.1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jruby:jruby-core:9.2.11.1 -> >=app-maven/jruby-core-9.2.11.1:0
# org.jruby:jruby-stdlib:9.2.11.1 -> >=dev-java/jruby-stdlib-bin-9.2.11.1:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=app-maven/jruby-core-9.2.11.1:0
	>=dev-java/jruby-stdlib-bin-9.2.11.1:0
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="utf-8"

JAVA_GENTOO_CLASSPATH_EXTRA="jruby-core,jruby-stdlib-bin"
