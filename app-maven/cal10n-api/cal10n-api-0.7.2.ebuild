# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/cal10n-api-0.7.2.pom --download-uri https://repo.maven.apache.org/maven2/ch/qos/cal10n/cal10n-api/0.7.2/cal10n-api-0.7.2-sources.jar --slot 0 --keywords "~amd64" --ebuild cal10n-api-0.7.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE="http://cal10n.qos.ch/cal10n-api"
SRC_URI="https://repo.maven.apache.org/maven2/ch/qos/cal10n/${PN}/${PV}/${P}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="ch.qos.cal10n:cal10n-api:0.7.2"



DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
"

S="${WORKDIR}"

