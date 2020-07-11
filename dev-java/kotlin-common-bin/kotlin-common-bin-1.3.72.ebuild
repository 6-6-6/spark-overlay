# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Pseudo kotlin libs"
HOMEPAGE=""
SRC_URI=""

MAVEN_PROVIDES="org.jetbrains.kotlin:kotlin-stdlib:1.3.72 org.jetbrains.kotlin:kotlin-stdlib-common:1.3.72 org.jetbrains.kotlin:kotlin-reflect:1.3.72"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

CP_DEPEND="
	>=dev-lang/kotlin-bin-${PV}
"

RDEPEND=">=virtual/jre-1.8
	${CP_DEPEND}"
DEPEND=">=virtual/jdk-1.8
	${CP_DEPEND}"

src_unpack() {
	mkdir -p ${S}
	cp ${EPREFIX}/opt/kotlin-bin/lib/*jar ${S}/
}

src_install() {
	for x in ${S}/*.jar ; do
		java-pkg_newjar "${x}" $(basename "${x%-*}.jar")
	done
}
