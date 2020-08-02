# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/leveldbjni-1.8.pom --download-uri https://repo1.maven.org/maven2/org/fusesource/leveldbjni/leveldbjni/1.8/leveldbjni-1.8-sources.jar --slot 0 --keywords "~amd64" --ebuild leveldbjni-1.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="leveldbjni is a jni library for acessing leveldb."
HOMEPAGE="http://leveldbjni.fusesource.org/leveldbjni"
SRC_URI="https://repo1.maven.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
	https://repo.maven.apache.org/maven2/org/fusesource/leveldbjni/leveldbjni/1.8/leveldbjni-1.8-native-src.zip
	"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.fusesource.leveldbjni:leveldbjni:1.8"
MAVEN_PROVIDES="org.fusesource.leveldbjni:leveldbjni-all:1.8"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.fusesource.hawtjni:hawtjni-runtime:1.9 -> >=dev-java/hawtjni-runtime-1.10:0
# org.iq80.leveldb:leveldb-api:0.6 -> >=dev-java/leveldb-api-0.6:0

CDEPEND="
	>=dev-java/leveldb-api-0.6:0
	>=dev-java/hawtjni-runtime-1.10:0
	dev-libs/leveldb[snappy]
"


DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="hawtjni-runtime,leveldb-api"
JAVA_SRC_DIR="src/main/java"
JNI_SRC_DIR="leveldbjni-1.8-native-src"

src_unpack() {
	mkdir -p ${JAVA_SRC_DIR} ${JNI_SRC_DIR}
	unzip -q ${DISTDIR}/${P}-sources.jar -d ${JAVA_SRC_DIR}
	unzip -q ${DISTDIR}/leveldbjni-1.8-native-src.zip -d ${S}
}

src_prepare() {
	default
	eapply -p0 ${FILESDIR}/${P}-free-unavailable-method.patch
	chmod +x ${JNI_SRC_DIR}/configure
}

src_configure() {
	cd ${JNI_SRC_DIR} || die
	econf
}

src_compile() {
	java-pkg-simple_src_compile
	emake -C ${JNI_SRC_DIR}
}

src_install() {
	java-pkg-simple_src_install
	java-pkg_doso ${JNI_SRC_DIR}/.libs/*so ${JNI_SRC_DIR}/*la
}
