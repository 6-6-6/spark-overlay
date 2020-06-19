# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/okhttp-2.7.5.pom --download-uri https://repo.maven.apache.org/maven2/com/squareup/okhttp/okhttp/2.7.5/okhttp-2.7.5-sources.jar --slot 0 --keywords "~amd64" --ebuild okhttp-2.7.5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="An HTTP+SPDY client for Android and Java applications"
HOMEPAGE="https://github.com/square/okhttp/okhttp"
SRC_URI="https://repo.maven.apache.org/maven2/com/squareup/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.squareup.okhttp:okhttp:2.7.5"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.squareup.okio:okio:1.6.0 -> >=dev-java/okio-1.11.0:0

CDEPEND="
	>=dev-java/okio-1.11.0:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.android:android:4.1.1.4 -> >=dev-java/android-4.1.1.4:0

DEPEND="
	>=virtual/jdk-1.7:*
	${CDEPEND}
	app-arch/unzip
	>=dev-java/android-4.1.1.4:0
"

RDEPEND="
	>=virtual/jre-1.7:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="okio"
JAVA_CLASSPATH_EXTRA="android"
