# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jruby-stdlib-9.2.11.1.pom --download-uri https://repo.maven.apache.org/maven2/org/jruby/jruby-stdlib/9.2.11.1/jruby-stdlib-9.2.11.1-sources.jar --slot 0 --keywords "~amd64" --ebuild jruby-stdlib-9.2.11.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="JRuby is the effort to recreate the Ruby (https://www.ruby-lang.org) interpreter in Java."
HOMEPAGE="https://github.com/jruby/jruby/jruby-stdlib"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/jruby-stdlib/${PV}/jruby-stdlib-9.2.11.1.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jruby:jruby-stdlib:9.2.11.1"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# rubygems:cmath:1.0.0 -> Compile-dependencies
# rubygems:csv:1.0.0 -> Compile-dependencies
# rubygems:did_you_mean:1.2.0 -> Compile-dependencies
# rubygems:fileutils:1.1.0 -> Compile-dependencies
# rubygems:ipaddr:1.2.0 -> Compile-dependencies
# rubygems:jar-dependencies:0.4.0 -> Compile-dependencies
# rubygems:jruby-openssl:0.10.4 -> Compile-dependencies
# rubygems:jruby-readline:1.3.7 -> Compile-dependencies
# rubygems:json:2.2.0 -> Compile-dependencies
# rubygems:minitest:5.10.3 -> Compile-dependencies
# rubygems:net-telnet:0.1.1 -> Compile-dependencies
# rubygems:power_assert:1.1.3 -> Compile-dependencies
# rubygems:psych:3.1.0 -> Compile-dependencies
# rubygems:rake:12.3.2 -> Compile-dependencies
# rubygems:rake-ant:1.0.4 -> Compile-dependencies
# rubygems:rdoc:6.1.2 -> Compile-dependencies
# rubygems:scanf:1.0.0 -> Compile-dependencies
# rubygems:test-unit:3.2.8 -> Compile-dependencies
# rubygems:webrick:1.4.2 -> Compile-dependencies
# rubygems:xmlrpc:0.3.0 -> Compile-dependencies

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="utf-8"

