# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN="protobuf-lite"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Fork of protobuf used by JetBrains for building Kotlin"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="
	https://teamcity.jetbrains.com/guestAuth/app/rest/builds/buildType:(id:Kotlin_Protobuf),status:SUCCESS,pinned:true,tag:${PV}/artifacts/content/internal/repo/org/jetbrains/kotlin/${MY_PN}/${PV}/${MY_P}-sources.jar -> ${P}-sources.jar
"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"

src_prepare() {
	java-pkg-2_src_prepare

	find "${JAVA_SRC_DIR}" -type f -exec sed -i -e \
		's/org.jetbrains.kotlin.protobuf/kotlin.reflect.jvm.internal.impl.protobuf/g' \
		{} \; || die "Failed to relocate Java package"
}
