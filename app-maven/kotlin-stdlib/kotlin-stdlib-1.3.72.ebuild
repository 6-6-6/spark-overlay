# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kotlin-stdlib-1.3.72.pom --download-uri https://repo.maven.apache.org/maven2/org/jetbrains/kotlin/kotlin-stdlib/1.3.72/kotlin-stdlib-1.3.72-sources.jar --slot 0 --keywords "~amd64" --ebuild kotlin-stdlib-1.3.72.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Kotlin Standard Library for JVM"
HOMEPAGE="https://kotlinlang.org/"
SRC_URI="https://repo.maven.apache.org/maven2/org/jetbrains/kotlin/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.jetbrains.kotlin:kotlin-stdlib:1.3.72"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.jetbrains:annotations:13.0 -> >=dev-java/jetbrains-annotation-19.0.0:19
# org.jetbrains.kotlin:kotlin-stdlib-common:1.3.72 -> >=app-maven/kotlin-stdlib-common-1.3.72:0

CDEPEND="
	>=app-maven/kotlin-stdlib-common-1.3.72:0
	>=dev-java/jetbrains-annotation-19.0.0:19
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

JAVA_GENTOO_CLASSPATH="jetbrains-annotation-19,kotlin-stdlib-common"
