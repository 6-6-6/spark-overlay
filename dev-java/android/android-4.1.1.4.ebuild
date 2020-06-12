# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/android-4.1.1.4.pom --download-uri https://repo.maven.apache.org/maven2/com/google/android/android/4.1.1.4/android-4.1.1.4-sources.jar --slot 0 --keywords "~amd64" --ebuild android-4.1.1.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A library jar that provides APIs for Applications written for the Google Android Platform."
HOMEPAGE="http://source.android.com/"
SRC_URI="https://repo.maven.apache.org/maven2/com/google/${PN}/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.google.android:android:4.1.1.4"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# commons-logging:commons-logging:1.1.1 -> >=dev-java/commons-logging-1.2:0
# org.apache.httpcomponents:httpclient:4.0.1 -> >=dev-java/httpcomponents-client-4.5:4.5
# org.json:json:20080701 -> >=dev-java/json-20160212:0
# xerces:xmlParserAPIs:2.6.2 -> >=dev-java/xerces-2.12.0:2
# xpp3:xpp3:1.1.4c -> >=dev-java/xpp3-1.1.4c:0

CDEPEND="
	>=dev-java/commons-logging-1.2:0
	>=dev-java/httpcomponents-client-4.5:4.5
	>=dev-java/json-20160212:0
	>=dev-java/xerces-2.12.0:2
	>=dev-java/xpp3-1.1.4c:0
"


DEPEND="
	>=virtual/jdk-1.8:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-logging,httpcomponents-client-4.5,json,xerces-2,xpp3"
