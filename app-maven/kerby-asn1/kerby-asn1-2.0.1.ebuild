# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/kerby-asn1-2.0.1.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/kerby/kerby-asn1/2.0.1/kerby-asn1-2.0.1-sources.jar --slot 0 --keywords "~amd64" --ebuild kerby-asn1-2.0.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Kerby ASN1 Project"
HOMEPAGE="https://directory.apache.org/kerby/kerby-common/kerby-asn1"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/kerby/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.kerby:kerby-asn1:2.0.1"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

