# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xbean-asm7-shaded-4.15.pom --download-uri https://repo1.maven.org/maven2/org/apache/xbean/xbean-asm7-shaded/4.15/xbean-asm7-shaded-4.15-sources.jar --slot 0 --keywords "~amd64" --ebuild xbean-asm7-shaded-4.15-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.apache.xbean:xbean-asm7-shaded:4.15"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Repackaged and shaded asm jars"
HOMEPAGE="https://geronimo.apache.org/maven/xbean/"
SRC_URI="
	https://repo1.maven.org/maven2/org/apache/xbean/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/xbean/${PN}/${PV}/${P}.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_prepare() {
	default

	# The upstream relocates some classes to a different package
	find -name "*.java" -exec \
		sed -i -e 's/org.apache.xbean.asm7.original.commons/org.apache.xbean.asm7.shade.commons/g' {} \; || \
		die "Failed to relocate Java package"
	find -name "*.java" -exec \
		sed -i -e 's/org.objectweb.asm/org.apache.xbean.asm7/g' {} \; || \
		die "Failed to relocate Java package"
}
