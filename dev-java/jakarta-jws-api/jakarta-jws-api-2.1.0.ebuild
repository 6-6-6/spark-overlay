# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# This version provides module java.xml.ws and package javax.xml.ws
MAVEN_ID="jakarta.jws:jakarta.jws-api:${PV}"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JWS API (Eclipse Project for JAX-WS)"
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jaxws"
SRC_URI="https://github.com/eclipse-ee4j/jws-api/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

# EDL-1.0 equivalent to BSD
# - 'SPDX-License-Identifier: BSD-3-Clause' in source files' headers
# - https://www.eclipse.org/org/documents/edl-v10.php
LICENSE="BSD"
# Since version 3.0.0, the namespace has changed to jakarta.xml.soap
SLOT="2"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/jws-api-${PV}"

JAVA_SRC_DIR="api/src/main/java"
JAVA_RESOURCE_DIRS=( "api/src/main/resources" )

DOCS=( CONTRIBUTING.md NOTICE.md README.md )

src_install() {
	java-pkg-simple_src_install
	einstalldocs # https://bugs.gentoo.org/789582
}
