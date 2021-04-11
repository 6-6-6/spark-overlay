# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/json-20170516.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/org/json/json/20170516/json-20170516-sources.jar --binjar-uri https://repo1.maven.org/maven2/org/json/json/20170516/json-20170516.jar --slot 0 --keywords "~amd64" --ebuild json-20170516.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"
MAVEN_ID="org.json:json:20170516"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="JSON is a light-weight, language independent, data interchange format. 		See http://www.JSON.org/ 		The files in this package implement JSON encoders/decoders in Java. 		It also includes the capability to convert between JSON and XML, HTTP 		headers, Cookies, and CDL. 		This is a reference implementation. There is a large number of JSON packages 		in Java. Perhaps someday the Java community will standardize on one. Until 		then, choose carefully. 		The license includes this restriction: \"The software shall be used for good, 		not evil.\" If your conscience cannot live with that, then choose a different 		package."
HOMEPAGE="https://github.com/douglascrockford/JSON-java"
SRC_URI="https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/org/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="JSON"
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
