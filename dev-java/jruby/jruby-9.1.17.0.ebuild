# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jruby-stdlib-9.2.11.1.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/jruby-stdlib/9.2.11.1/jruby-stdlib-9.2.11.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jruby-stdlib-9.2.11.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="JRuby Complete"
HOMEPAGE="https://github.com/jruby/jruby/"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/jruby-stdlib/${PV}/jruby-stdlib-9.2.11.1.jar"
SRC_URI="https://repo1.maven.org/maven2/org/jruby/${PN}-complete/${PV}/${PN}-complete-${PV}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby:jruby-complete:9.1.17.0"


DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="utf-8"

