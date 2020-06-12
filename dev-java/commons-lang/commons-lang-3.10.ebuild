# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/commons-lang3-3.10.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/commons/commons-lang3/3.10/commons-lang3-3.10-sources.jar --slot 0 --keywords "~amd64" --ebuild commons-lang3-3.10.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN=${PN}3

DESCRIPTION="Apache Commons Lang, a package of Java utility classes for the
  classes that are in java.lang's hierarchy, or are considered to be so
  standard as to justify existence in java.lang."
HOMEPAGE="https://commons.apache.org/proper/commons-lang/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/commons/${MY_PN}/${PV}/${MY_PN}-${PV}-sources.jar"
LICENSE=""
SLOT="3"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.commons:commons-lang3:3.10"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="ISO-8859-1"

JAVA_RESOURCE_DIRS=(
	"../../../../../../../../var/lib/java-ebuilder/poms/src/main/resources"
	"../../../../../../../../var/lib/java-ebuilder/poms"
)
