# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.h2database:${PN}:${PV}"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="H2 Database Engine"
HOMEPAGE="https://www.h2database.com"
SRC_URI="
	https://repo1.maven.org/maven2/com/${PN}database/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/${PN}database/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="|| ( MPL-2.0 EPL-1.0 )"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="
	dev-java/jts-core:0
	dev-java/lucene:0
	dev-java/lucene-analyzers-common:0
	dev-java/lucene-queryparser:0
	dev-java/osgi-core:4
	dev-java/osgi-service-jdbc:0
	dev-java/slf4j-api:0
	java-virtuals/servlet-api:4.0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? (
		${CP_DEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CP_DEPEND}
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	java-pkg-maven_src_unpack
	use binary && return

	# Extract files from the upstream's pre-built JAR for pkgdiff test
	mkdir binjar ||
		die "Failed to create directory for files unpacked from binary JAR"
	pushd binjar > /dev/null ||
		die "Failed to enter directory for files unpacked from binary JAR"
	unpack "${JAVA_BINJAR_FILENAME}"
	popd > /dev/null ||
		die "Failed to leave directory for files unpacked from binary JAR"
}

src_prepare() {
	eapply "${FILESDIR}/${P}-fix-CVE-2022-23221.patch"
	if ! has_version ">=dev-java/lucene-8.0.0:0"; then
		eapply "${FILESDIR}/${P}-for-lucene-pre-8.0.0.patch"
	fi
	java-pkg-2_src_prepare
}

src_compile() {
	java-pkg-simple_src_compile
	use binary && return

	# Add files included in the upstream's pre-built JAR
	pushd binjar > /dev/null ||
		die "Failed to enter directory for files unpacked from binary JAR"
	jar uf "${S}/${JAVA_JAR_FILENAME}" org/h2/util/data.zip ||
		die "Failed to add additional files to the JAR"
	popd > /dev/null ||
		die "Failed to leave directory for files unpacked from binary JAR"
}
