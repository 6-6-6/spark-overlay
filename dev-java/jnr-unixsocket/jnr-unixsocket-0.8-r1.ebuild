# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.github.jnr:jnr-unixsocket:0.8"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Native I/O access for java"
HOMEPAGE="http://github.com/jnr/jnr-unixsocket"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jnr-constants:0.8.7 -> >=dev-java/jnr-constants-0.8.7:0
# com.github.jnr:jnr-enxio:0.9 -> >=dev-java/jnr-enxio-0.9:0
# com.github.jnr:jnr-ffi:2.0.3 -> dev-java/jnr-ffi:2
# com.github.jnr:jnr-posix:3.0.12 -> >=dev-java/jnr-posix-3.0.12:0

CP_DEPEND="
	>=dev-java/jnr-constants-0.8.7:0
	>=dev-java/jnr-enxio-0.9:0
	dev-java/jnr-ffi:2
	>=dev-java/jnr-posix-3.0.12:0
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

JAVA_SRC_DIR="src/main/java"
