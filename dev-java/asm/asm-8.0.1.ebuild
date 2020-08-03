# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/asm-8.0.1.pom --download-uri https://repo.maven.apache.org/maven2/org/ow2/asm/asm/8.0.1/asm-8.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild asm-8.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.ow2.asm:asm:8.0.1"
MAVEN_PROVIDES="org.ow2.asm:asm-analysis:8.0.1 org.ow2.asm:asm-commons:8.0.1 org.ow2.asm:asm-tree:8.0.1 org.ow2.asm:asm-util:8.0.1"

inherit java-pkg-2 java-pkg-simple

PN_ANA=${PN}-analysis
PN_COMM=${PN}-commons
PN_TREE=${PN}-tree
PN_UTIL=${PN}-util

DESCRIPTION="ASM, a very small and fast Java bytecode manipulation framework"
HOMEPAGE="http://asm.ow2.io/"
SRC_URI="https://repo.maven.apache.org/maven2/org/ow2/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}.jar
		https://repo.maven.apache.org/maven2/org/ow2/asm/${PN_ANA}/${PV}/${PN_ANA}-${PV}-sources.jar -> ${PN_ANA}-${PV}.jar
		https://repo.maven.apache.org/maven2/org/ow2/asm/${PN_COMM}/${PV}/${PN_COMM}-${PV}-sources.jar -> ${PN_COMM}-${PV}.jar
		https://repo.maven.apache.org/maven2/org/ow2/asm/${PN_TREE}/${PV}/${PN_TREE}-${PV}-sources.jar -> ${PN_TREE}-${PV}.jar
		https://repo.maven.apache.org/maven2/org/ow2/asm/${PN_UTIL}/${PV}/${PN_UTIL}-${PV}-sources.jar -> ${PN_UTIL}-${PV}.jar"
LICENSE="BSD"
SLOT="7"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86 ~x64-macos"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
SRC_DIRS=(
	"${PN}"
	"${PN_TREE}"
	"${PN_COMM}"
	"${PN_ANA}"
	"${PN_UTIL}"
)

src_unpack() {
	for pkg in "${SRC_DIRS[@]}"; do
		mkdir -p "${S}"/${pkg}
		unzip -q -o "${DISTDIR}"/${pkg}\-${PV}.jar -d "${S}"/${pkg} || die
	done
}

src_compile() {
	JAVA_GENTOO_CLASSPATH_EXTRA=""
	for pkg in "${SRC_DIRS[@]}"; do
		JAVA_SRC_DIR="${pkg}" JAVA_JAR_FILENAME="${pkg}.jar"\
			java-pkg-simple_src_compile
		rm target/classes/* -r || die
		JAVA_GENTOO_CLASSPATH_EXTRA+="${pkg}.jar:"
	done
}

src_install() {
	for pkg in "${SRC_DIRS[@]}"; do
		JAVA_JAR_FILENAME="${pkg}.jar" java-pkg-simple_src_install
	done
}
