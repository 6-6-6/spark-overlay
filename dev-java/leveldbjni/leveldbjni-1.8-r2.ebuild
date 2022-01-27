# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="org.fusesource.leveldbjni:${PN}:${PV}"
MAVEN_PROVIDES="org.fusesource.leveldbjni:${PN}-all:${PV}"

JAVA_PKG_IUSE="doc source binary test"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit autotools java-pkg-2 java-pkg-simple

DESCRIPTION="A JNI library for acessing leveldb"
HOMEPAGE="https://github.com/fusesource/leveldbjni"
SRC_URI="
	https://repo1.maven.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
	https://repo.maven.apache.org/maven2/org/fusesource/${PN}/${PN}/${PV}/${P}-native-src.zip
"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.fusesource.hawtjni:hawtjni-runtime:1.9 -> >=dev-java/hawtjni-runtime-1.10:0
# org.iq80.leveldb:leveldb-api:0.6 -> >=dev-java/leveldb-api-0.6:0

CP_DEPEND="
	>=dev-java/leveldb-api-0.6:0
	>=dev-java/hawtjni-runtime-1.10:0
"

CDEPEND="
	dev-libs/leveldb[snappy]
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JNI_SRC_DIR="${P}-native-src"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	mkdir -p "${JAVA_SRC_DIR}" "${JNI_SRC_DIR}"
	unzip -q "${DISTDIR}/${P}-sources.jar" -d "${JAVA_SRC_DIR}"
	unzip -q "${DISTDIR}/${P}-native-src.zip" -d "${S}"
}

src_prepare() {
	default
	eapply -p0 "${FILESDIR}/${P}-free-unavailable-method.patch"
	sed -i -e "s/\${project.version}/${PV}/g" \
		"${JAVA_SRC_DIR}/org/fusesource/leveldbjni/version.txt" || \
		die "Failed to write project version to source files"

	pushd "${JNI_SRC_DIR}" > /dev/null || \
		die "Failed to enter JNI sources directory"

	# Create a temporary patched copy of slice.h
	mkdir leveldb || die "Failed to create leveldb headers directory"
	cp "${ESYSROOT}/usr/include/leveldb/slice.h" leveldb || \
		die "Failed to copy leveldb headers"
	eapply -p2 "${FILESDIR}/leveldb-1.20-support-leveldbjni.patch"

	# Regenerate configure script to fill in proper package version
	eautoreconf

	popd > /dev/null || die "Failed to leave JNI sources directory"
}

src_configure() {
	cd "${JNI_SRC_DIR}" || die
	econf
}

src_compile() {
	java-pkg-simple_src_compile
	emake -C "${JNI_SRC_DIR}"
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd "${JAVA_SRC_DIR}" > /dev/null || die "Failed to enter JAVA_SRC_DIR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" org/fusesource/leveldbjni/version.txt || \
		die "Failed to add additional files to the JAR"
	popd > /dev/null || die "Failed to leave JAVA_SRC_DIR"
}

src_install() {
	java-pkg-simple_src_install
	java-pkg_doso "${JNI_SRC_DIR}"/.libs/*so
}
