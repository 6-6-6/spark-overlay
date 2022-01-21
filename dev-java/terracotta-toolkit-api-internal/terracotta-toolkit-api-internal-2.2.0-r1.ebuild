# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MAVEN_ID="org.terracotta.toolkit:terracotta-toolkit-api-internal:2.2.0"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Terracotta Toolkit API Internal"
HOMEPAGE="https://repo.spring.io/plugins-release/org/terracotta/toolkit/terracotta-toolkit-api"
SRC_URI="https://repo.terracotta.org/maven2/org/terracotta/toolkit/${PN}/${PV}/${P}.jar"
LICENSE="Apache-2.0 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
