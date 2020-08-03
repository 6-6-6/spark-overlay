# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_PROVIDES="org.scala-lang:scala-library:2.12.10 org.scala-lang:scala-reflect:2.12.10 org.scala-lang.modules:scala-xml_2.12:1.2.0"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Pseudo scala libs"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI=""

LICENSE="BSD"
SLOT="2.12"
KEYWORDS="~amd64 ~x86"

IUSE=""

CP_DEPEND="
	dev-lang/scala:${SLOT}
"

RDEPEND=">=virtual/jre-1.8
	${CP_DEPEND}"
DEPEND=">=virtual/jdk-1.8
	${CP_DEPEND}"

src_unpack() {
	mkdir -p "${S}"
	cp "${EPREFIX}"/usr/share/scala-2.12/lib/*jar "${S}"/
}

src_install() {
	for x in "${S}"/*.jar ; do
		java-pkg_newjar "${x}" $(basename "${x%-*}.jar")
	done
}
