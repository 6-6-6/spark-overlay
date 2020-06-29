# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-compiler-3.1.2.pom --download-uri https://repo.maven.apache.org/maven2/org/codehaus/janino/commons-compiler/3.1.2/commons-compiler-3.1.2-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-compiler-3.1.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="The \"commons-compiler\" API, including the \"IExpressionEvaluator\", \"IScriptEvaluator\", \"IClassBodyEvaluator\" and \"ISimpleCompiler\" interfaces."
HOMEPAGE="http://janino-compiler.github.io/commons-compiler/"
SRC_URI="https://repo.maven.apache.org/maven2/org/codehaus/janino/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.codehaus.janino:commons-compiler:3.1.2"



DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.6:*
"

S="${WORKDIR}"

