# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/fastutil-8.3.1.pom --download-uri https://repo.maven.apache.org/maven2/it/unimi/dsi/fastutil/8.3.1/fastutil-8.3.1-sources.jar --slot 0 --keywords "~amd64" --ebuild fastutil-8.3.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="fastutil extends the Java Collections Framework by providing type-specific maps, sets, lists and priority queues with a small memory footprint and fast access and insertion; provides also big (64-bit) arrays, sets and lists, and fast, practical I/O classes for binary and text files."
HOMEPAGE="http://fastutil.di.unimi.it/"
SRC_URI="https://repo.maven.apache.org/maven2/it/unimi/dsi/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="it.unimi.dsi:fastutil:8.3.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

