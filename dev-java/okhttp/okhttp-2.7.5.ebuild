# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/okhttp-2.7.5.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/squareup/okhttp/okhttp/2.7.5/okhttp-2.7.5-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/squareup/okhttp/okhttp/2.7.5/okhttp-2.7.5.jar --slot 0 --keywords "~amd64" --ebuild okhttp-2.7.5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.squareup.okhttp:okhttp:2.7.5"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="An HTTP+SPDY client for Android and Java applications"
HOMEPAGE="https://github.com/square/okhttp/okhttp"
SRC_URI="https://repo1.maven.org/maven2/com/squareup/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/squareup/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.squareup.okio:okio:1.6.0 -> >=dev-java/okio-1.11.0:0

CDEPEND="
	>=dev-java/okio-1.11.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.android:android:4.1.1.4 -> >=dev-java/android-util-4.1.1.4:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/android-util-4.1.1.4:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="okio"
JAVA_CLASSPATH_EXTRA="android-util"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
