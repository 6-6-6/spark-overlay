# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/truffle-nfi-20.1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/graalvm/truffle/truffle-nfi/20.1.0/truffle-nfi-20.1.0-sources.jar --slot 0 --keywords "~amd64" --ebuild truffle-nfi-20.1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.graalvm.truffle:truffle-nfi:20.1.0"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Native function interface for the Truffle framework."
HOMEPAGE="https://openjdk.java.net/projects/graal"
SRC_URI="
	https://repo.maven.apache.org/maven2/org/graalvm/truffle/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/graalvm/truffle/${PN}-native-linux-amd64/${PV}/${PN}-native-linux-amd64-${PV}.tar.gz
"
LICENSE="UPL-1.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.graalvm.truffle:truffle-api:20.1.0 -> dev-java/truffle-api

CDEPEND="
	dev-java/truffle-api:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="truffle-api"
JAVA_SRC_DIR="src/main/java"

src_unpack() {
	mkdir -p ${JAVA_SRC_DIR}
	unzip -q "${DISTDIR}"/${P}-sources.jar -d ${JAVA_SRC_DIR} || die "failed to unpack source code"
	tar xvf "${DISTDIR}"/${PN}-native-linux-amd64-${PV}.tar.gz || die "failed to unpack truffle-nfi-native"
}

src_install() {
	java-pkg-simple_src_install
	java-pkg_doso bin/*so

	insinto /usr/include
	doheader -r include/*
}
