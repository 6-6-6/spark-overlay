# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/snappy-java-1.1.7.5.pom --download-uri https://repo.maven.apache.org/maven2/org/xerial/snappy/snappy-java/1.1.7.5/snappy-java-1.1.7.5-sources.jar --slot 0 --keywords "~amd64" --ebuild snappy-java-1.1.7.5.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="snappy-java: A fast compression/decompression library"
HOMEPAGE="https://github.com/xerial/snappy-java"
SRC_URI="https://repo.maven.apache.org/maven2/org/xerial/snappy/${PN}-java/${PV}/${PN}-java-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="1.1"
KEYWORDS="~amd64"
#"x86"
MAVEN_ID="org.xerial.snappy:snappy-java:1.1.7.5"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:org.osgi.core:4.3.0 -> >=dev-java/osgi-core-6.0.0:6

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=dev-java/osgi-core-6.0.0:6
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_CLASSPATH_EXTRA="osgi-core-6"

JAVA_SRC_DIR="src/main/java"
