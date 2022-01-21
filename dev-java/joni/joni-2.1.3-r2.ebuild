# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.jruby.joni:${PN}:${PV}"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java port of Oniguruma that uses byte arrays directly"
HOMEPAGE="https://github.com/jruby/joni"
SRC_URI="https://repo.maven.apache.org/maven2/org/jruby/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE="MIT"
SLOT="2.1"
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~x86-solaris"

CP_DEPEND="
	>=dev-java/jcodings-1.0.11:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
	>=dev-java/asm-5.0.3:4
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="asm-4"
JAVADOC_ARGS="-source 8"
