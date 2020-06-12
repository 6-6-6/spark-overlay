# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/json-smart-2.3.pom --download-uri https://repo.maven.apache.org/maven2/net/minidev/json-smart/2.3/json-smart-2.3-sources.jar --slot 1.3 --keywords "~amd64" --ebuild json-smart-2.3.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JSON (JavaScript Object Notation) is a lightweight data-interchange format. It is easy for humans to read and write. It is easy for machines to parse and generate. It is based on a subset of the JavaScript Programming Language, Standard ECMA-262 3rd Edition - December 1999. JSON is a text format that is completely language independent but uses conventions that are familiar to programmers of the C-family of languages, including C, C++, C#, Java, JavaScript, Perl, Python, and many others. These properties make JSON an ideal data-interchange language."
HOMEPAGE="http://www.minidev.net/"
SRC_URI="https://repo.maven.apache.org/maven2/net/minidev/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="1.3"
KEYWORDS="~amd64"
MAVEN_ID="net.minidev:json-smart:2.3"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# net.minidev:accessors-smart:1.2 -> >=app-maven/accessors-smart-1.2:0

CDEPEND="
	>=app-maven/accessors-smart-1.2:0
"


DEPEND="
	>=virtual/jdk-1.6:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="accessors-smart"
