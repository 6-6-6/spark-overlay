# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/zstd-jni-1.4.4-7.pom --download-uri https://repo1.maven.org/maven2/com/github/luben/zstd-jni/1.4.4-7/zstd-jni-1.4.4-7-sources.jar --slot 0 --keywords "~amd64" --ebuild zstd-jni-1.4.4.7-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.github.luben:zstd-jni:1.4.4-7"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JNI bindings for Zstd native library that provides fast and high compression lossless algorithm for Java and all JVM languages."
HOMEPAGE="https://github.com/luben/zstd-jni"
SRC_URI="https://repo1.maven.org/maven2/com/github/luben/${PN}/1.4.4-7/${PN}-1.4.4-7-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/com/github/luben/${PN}/1.4.4-7/${PN}-1.4.4-7.jar -> ${P}-bin.jar"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
