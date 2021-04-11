# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/google-http-client-1.22.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/google/http-client/google-http-client/1.22.0/google-http-client-1.22.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/google/http-client/google-http-client/1.22.0/google-http-client-1.22.0.jar --slot 0 --keywords "~amd64" --ebuild google-http-client-1.22.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="com.google.http-client:google-http-client:1.22.0"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Google HTTP Client Library for Java. Functionality that works on all supported Java platforms, including Java 5 (or higher) desktop (SE) and web (EE), Android, and Google App Engine."
HOMEPAGE="https://github.com/google/google-http-java-client/google-http-client"
SRC_URI="https://repo1.maven.org/maven2/com/google/http-client/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/com/google/http-client/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.code.findbugs:jsr305:1.3.9 -> >=dev-java/jsr305-3.0.1:0
# org.apache.httpcomponents:httpclient:4.0.1 -> >=dev-java/httpcomponents-client-4.5:4.5

CDEPEND="
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/jsr305-3.0.1:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.google.android:android:1.5_r4 -> >=dev-java/android-util-4.1.1.4:0
# com.google.guava:guava-jdk5:17.0 -> >=dev-java/guava-jdk5-17.0:0
# commons-codec:commons-codec:1.6 -> >=dev-java/commons-codec-1.7:0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? (
		${CDEPEND}
		>=dev-java/android-util-4.1.1.4:0
		>=dev-java/commons-codec-1.7:0
		>=dev-java/guava-jdk5-17.0:0
	)
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jsr305,httpcomponents-client-4.5"
JAVA_CLASSPATH_EXTRA="android-util,guava-jdk5,commons-codec"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
