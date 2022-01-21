# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/classworlds-1.1-alpha-2.pom --download-uri https://repo1.maven.org/maven2/classworlds/classworlds/1.1-alpha-2/classworlds-1.1-alpha-2.jar --slot 0 --keywords "~amd64" --ebuild classworlds-1.1_alpha2.ebuild

EAPI=8

MAVEN_ID="classworlds:classworlds:1.1-alpha-2"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="A framework for developers who require complex manipulation of ClassLoaders"
HOMEPAGE="https://codehaus-plexus.github.io/plexus-classworlds/"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/1.1-alpha-2/${PN}-1.1-alpha-2.jar -> ${P}.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
