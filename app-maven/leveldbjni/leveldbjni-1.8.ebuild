# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/leveldbjni-1.8.pom --download-uri https://repo.maven.apache.org/maven2/org/fusesource/leveldbjni/leveldbjni/1.8/leveldbjni-1.8-sources.jar --slot 0 --keywords "~amd64" --ebuild leveldbjni-1.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="leveldbjni is a jni library for acessing leveldb."
HOMEPAGE="http://leveldbjni.fusesource.org/leveldbjni"
SRC_URI="https://repo.maven.apache.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}-sources.jar -> ${P}.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.fusesource.leveldbjni:leveldbjni:1.8"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.fusesource.hawtjni:hawtjni-runtime:1.9 -> >=dev-java/hawtjni-runtime-1.10:0
# org.iq80.leveldb:leveldb-api:0.6 -> >=app-maven/leveldb-api-0.6:0

CDEPEND="
	>=app-maven/leveldb-api-0.6:0
	>=dev-java/hawtjni-runtime-1.10:0
"


DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="hawtjni-runtime,leveldb-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${S}/${JAVA_SRC_DIR}
	unzip ${DISTDIR}/${P}.jar -d ${S}/${JAVA_SRC_DIR}
}
