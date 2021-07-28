# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/rngom-201605.pom --download-uri https://repo1.maven.org/maven2/org/kohsuke/rngom/rngom/201605/rngom-201605-sources.jar --slot 0 --keywords "~amd64" --ebuild rngom-201605.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="org.kohsuke.rngom:rngom:201605"
JAVA_TESTING_FRAMEWORKS="pkgdiff"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PV=201605

DESCRIPTION="RNGOM is an open-source Java library for parsing RELAX NG grammars."
HOMEPAGE="http://rngom.java.net/"
SRC_URI="
	https://repo1.maven.org/maven2/org/kohsuke/${PN}/${PN}/${MY_PV}/${PN}-${MY_PV}-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/kohsuke/${PN}/${PN}/${MY_PV}/${PN}-${MY_PV}.jar -> ${P}-bin.jar
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# relaxngDatatype:relaxngDatatype:20020414 -> >=dev-java/relaxng-datatype-1.0:0

CDEPEND="
	>=dev-java/relaxng-datatype-1.0:0
"

BDEPEND="
	app-arch/unzip
"

DEPEND="
	>=virtual/jdk-1.8:*
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="relaxng-datatype"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
