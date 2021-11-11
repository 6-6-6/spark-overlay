# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.github.jnr:jnr-posix:3.0.12"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Common cross-project/cross-platform POSIX APIs"
HOMEPAGE="http://nexus.sonatype.org/oss-repository-hosting.html/jnr-posix"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar"
LICENSE="LGPL-2.1 CPL-1.0 GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux ~x86-solaris"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jnr-constants:0.8.7 -> >=dev-java/jnr-constants-0.8.7:0
# com.github.jnr:jnr-ffi:2.0.3 -> dev-java/jnr-ffi:2

CP_DEPEND="
	>=dev-java/jnr-constants-0.8.7:0
	dev-java/jnr-ffi:2
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CP_DEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"
