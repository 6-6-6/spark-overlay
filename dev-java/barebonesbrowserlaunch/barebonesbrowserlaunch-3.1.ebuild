# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.centerkey.utils:barebonesbrowserlaunch:3.1"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Use the default browser to open a web page from a Swing application"
HOMEPAGE="https://centerkey.com/java/browser/"
SRC_URI="https://centerkey.com/java/browser/project/com/centerkey/utils/BareBonesBrowserLaunch.java"
LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

RDEPEND=">=virtual/jre-1.8"
DEPEND=">=virtual/jdk-1.8"

JAVA_SRC_DIR=${S}

src_unpack() {
	mkdir -p "${S}"/com/centerkey/utils

	cp "${DISTDIR}"/${A} "${S}"/com/centerkey/utils
}
