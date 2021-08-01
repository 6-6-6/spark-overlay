# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /tmp/java-ebuilder/poms/android-all-10-robolectric-5803371.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/robolectric/android-all/10-robolectric-5803371/android-all-10-robolectric-5803371-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/robolectric/android-all/10-robolectric-5803371/android-all-10-robolectric-5803371.jar --slot 0 --keywords "~amd64" --ebuild android-all-10.5803371.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.robolectric:android-all:10-robolectric-5803371"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="APIs for Applications written for the Google Android Platform"
HOMEPAGE="https://source.android.com/"
SRC_URI="
	https://repo1.maven.org/maven2/org/robolectric/${PN}/10-robolectric-5803371/${PN}-10-robolectric-5803371-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/robolectric/${PN}/10-robolectric-5803371/${PN}-10-robolectric-5803371.jar -> ${P}-bin.jar
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Lots of compiler errors when being built from source
IUSE="+binary"

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

JAVA_BINJAR_FILENAME="${P}-bin.jar"

src_unpack() {
	if use binary; then
		# The JARs for this package are huge, skip unnecessary unpacking
		for f in ${A}; do
			[[ "${f}" != *.jar ]] && unpack "${f}"
		done
	else
		default
	fi
}

src_prepare() {
	default
	find . -name "*.annotated.java" -delete || \
		die "Failed to delete *.annotated.java"
}
