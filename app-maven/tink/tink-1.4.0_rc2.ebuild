# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/tink-1.4.0-rc2.pom --download-uri https://repo.maven.apache.org/maven2/com/google/crypto/tink/tink/1.4.0-rc2/tink-1.4.0-rc2-sources.jar --slot 0 --keywords "~amd64" --ebuild tink-1.4.0_rc2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Tink is a small cryptographic library that provides a safe, simple, agile and fast way to accomplish some common cryptographic tasks."
HOMEPAGE="http://github.com/google/tink"
SRC_URI="https://repo.maven.apache.org/maven2/com/google/crypto/${PN}/${PN}/1.4.0-rc2/${PN}-1.4.0-rc2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.google.crypto.tink:tink:1.4.0-rc2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-1.4.0-rc2.pom
# com.google.protobuf:protobuf-java:3.11.1 -> >=app-maven/protobuf-java-3.12.2:0
# org.json:json:20180813 -> >=dev-java/json-20150729:0

CDEPEND="
	>=app-maven/protobuf-java-3.12.2:0
	>=dev-java/json-20150729:0
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

JAVA_GENTOO_CLASSPATH="protobuf-java,json"
