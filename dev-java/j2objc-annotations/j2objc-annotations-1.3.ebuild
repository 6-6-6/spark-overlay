# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN%-annotations}"
MY_P="${MY_PN}-${PV}"
JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.google.j2objc:j2objc-annotations:1.3"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Annotations for the J2ObjC Java to Objective-C translator"
HOMEPAGE="http://j2objc.org"
SRC_URI="https://github.com/google/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND=">=virtual/jdk-1.8"
RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}/annotations"
JAVA_SRC_DIR="src/main/java"
