# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/okio-2.7.0-alpha.lockfree.2.pom --download-uri https://repo.maven.apache.org/maven2/com/squareup/okio/okio/2.7.0-alpha.lockfree.2/okio-2.7.0-alpha.lockfree.2-sources.jar --slot 0 --keywords "~amd64" --ebuild okio-2.7.0.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A modern I/O API for Java"
HOMEPAGE="https://github.com/square/okio/"
SRC_URI="https://repo.maven.apache.org/maven2/com/squareup/${PN}/${PN}/2.7.0-alpha.lockfree.2/${PN}-2.7.0-alpha.lockfree.2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.squareup.okio:okio:2.7.0-alpha.lockfree.2"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-2.7.0-alpha.lockfree.2.pom
# org.jetbrains.kotlin:kotlin-stdlib:1.3.70 -> >=app-maven/kotlin-stdlib-1.3.72:0
# org.jetbrains.kotlin:kotlin-stdlib-common:1.3.70 -> >=app-maven/kotlin-stdlib-common-1.3.72:0

CDEPEND="
	>=app-maven/kotlin-stdlib-1.3.72:0
	>=app-maven/kotlin-stdlib-common-1.3.72:0
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

JAVA_GENTOO_CLASSPATH="kotlin-stdlib,kotlin-stdlib-common"
