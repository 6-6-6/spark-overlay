# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"

MAVEN_ID="com.github.rdblue:brotli-codec:0.1.1"
inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="${P}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

CP_DEPEND=""

RDEPEND=">=virtual/jre-1.8
  ${CP_DEPEND}"
DEPEND=">=virtual/jdk-1.8
  ${CP_DEPEND}"
