# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MAVEN_ID="no.priv.garshol.duke:${PN}:${PV}"

JAVA_PKG_IUSE="doc source test binary"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="A configurable record linkage engine"
HOMEPAGE="https://github.com/larsga/Duke"
SRC_URI="
	https://repo1.maven.org/maven2/no/priv/garshol/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/no/priv/garshol/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
# src/main/java/no/priv/garshol/duke/duke.properties is meant to be different
# for each build, but any discrepancy in this file will fail pkgdiff check
RESTRICT="test"

CP_DEPEND="
	dev-java/lucene:4.0
	dev-java/lucene-analyzers-common:4.0
	dev-java/lucene-spatial:4.0
	dev-java/mapdb:0.9.9
	>=dev-java/commonj-1.1.1:0
	java-virtuals/servlet-api:2.4
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

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	if ! use binary; then
		eapply "${FILESDIR}/${P}-fix-raw-type.patch"
	fi

	eapply_user

	if ! use binary; then
		sed -i -e "s/\${project.version}/${PV}/g" \
			"${JAVA_SRC_DIR}/no/priv/garshol/duke/duke.properties" || \
			die "Failed to write project version to build properties"
		sed -i -e "s/\${buildNumber}/1 ($(date '+%F'))/g" \
			"${JAVA_SRC_DIR}/no/priv/garshol/duke/duke.properties" || \
			die "Failed to write build number to build properties"
		sed -i -e "s/\${user.name}/$(id -un)/g" \
			"${JAVA_SRC_DIR}/no/priv/garshol/duke/duke.properties" || \
			die "Failed to write builder's user name to build properties"
	fi
}
