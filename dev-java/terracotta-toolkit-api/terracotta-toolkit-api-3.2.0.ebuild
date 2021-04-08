# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.terracotta.toolkit:terracotta-toolkit-api:3.2.0"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="${MAVEN_ID}"
HOMEPAGE="https://repo.spring.io/plugins-release/org/terracotta/toolkit/terracotta-toolkit-api"
SRC_URI="https://public.nexus.pentaho.org/content/groups/omni/org/terracotta/toolkit/terracotta-toolkit-1.3-api/3.2.0/terracotta-toolkit-1.3-api-${PV}.jar"
LICENSE="Apache-2.0 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
