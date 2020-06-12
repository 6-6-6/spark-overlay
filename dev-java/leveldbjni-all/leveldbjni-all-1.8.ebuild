# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/leveldbjni-all-1.8.pom --download-uri https://repo.maven.apache.org/maven2/org/fusesource/leveldbjni/leveldbjni-all/1.8/leveldbjni-all-1.8-sources.jar --slot 0 --keywords "~amd64" --ebuild leveldbjni-all-1.8.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="An uber jar which contains all the leveldbjni platform libraries and dependencies"
HOMEPAGE="http://leveldbjni.fusesource.org/leveldbjni-all"
SRC_URI="https://repo.maven.apache.org/maven2/org/fusesource/leveldbjni/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.fusesource.leveldbjni:leveldbjni-all:1.8"


# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.fusesource.leveldbjni:leveldbjni:1.8 -> !!!artifactId-not-found!!!

DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	>=app-maven/leveldbjni-1.8
	>=dev-libs/libleveldbjni-1.8
"

RDEPEND="
	>=virtual/jre-1.5:*
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH_EXTRA="leveldbjni"
