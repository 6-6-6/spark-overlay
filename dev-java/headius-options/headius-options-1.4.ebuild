# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/options-1.4.pom --download-uri https://repo.maven.apache.org/maven2/com/headius/options/1.4/options-1.4-sources.jar --slot 0 --keywords "~amd64" --ebuild options-1.4.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.headius:options:1.4"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Sonatype helps open source projects to set up Maven repositories on https://oss.sonatype.org/"
HOMEPAGE="https://github.com/headius/options"
SRC_URI="https://repo.maven.apache.org/maven2/com/headius/options/${PV}/options-${PV}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
