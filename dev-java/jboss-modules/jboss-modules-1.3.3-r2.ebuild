# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="source" # doc (needs APIviz)

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JBoss modular classloading system"
HOMEPAGE="https://www.jboss.org/"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.Final.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	virtual/jdk:1.8
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}/${P}.Final/"

JAVA_SRC_DIR="src/main/java"
JAVA_RESOURCE_DIRS="src/main/resources"
