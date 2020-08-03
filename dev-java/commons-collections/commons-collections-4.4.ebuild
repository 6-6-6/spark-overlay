# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-collections4-4.4.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-collections4/4.4/commons-collections4-4.4-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-collections4-4.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="org.apache.commons:commons-collections4:4.4"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MY_PN=${PN}4

DESCRIPTION="The Apache Commons Collections package contains types that extend and augment the Java Collections Framework."
HOMEPAGE="https://commons.apache.org/proper/commons-collections/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${MY_PN}/${PV}/${MY_PN}-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="4"
KEYWORDS="~amd64 ~ppc64 ~x86"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_RESOURCE_DIRS=(
	"src/main/resources"
)
JAVA_SRC_DIR="src/main/java"
