# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.aspectj:aspectjweaver:1.9.5"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A seamless aspect-oriented extension to the Java programming language"
HOMEPAGE="http://eclipse.org/aspectj/"
SRC_URI="http://www.eclipse.org/downloads/download.php?file=/tools/${PN}/${P}-src.jar&r=1 -> ${P}-src.jar"

#MAVEN_PROVIDES="org.aspectj:aspectjweaver:1.9.5 org.aspectj:aspectjtools:1.9.5 org.aspectj:aspectjrt:1.9.5"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CDEPEND=">=dev-java/asm-7.0.0:7
	dev-java/commons-logging:0"
DEPEND="${CDEPEND}
	app-arch/zip
	>=virtual/jdk-1.8"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.8"

S=${WORKDIR}

JAVA_SRC_DIR="${S}/src"
JAVA_GENTOO_CLASSPATH="commons-logging,asm-7"
JAVA_ENCODING="iso8859-1"

src_unpack() {
	default
	unzip -q "${S}"/aspectjweaver-${PV}-sources.jar -d "${S}"/src/ || die
}

java_prepare() {
	default

	# needs part of BEA JRockit to compile
	rm "${S}"/src/org/aspectj/weaver/loadtime/JRockitAgent.java || die
	# aspectj uses a renamed version of asm:4
	find -name "*.java" -exec sed -i -e 's/import aj.org.objectweb.asm./import org.objectweb.asm./g' {} \; || die
}
