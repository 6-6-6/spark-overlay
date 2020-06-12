# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/javax.activation-api-1.2.0.pom --download-uri https://repo.maven.apache.org/maven2/javax/activation/javax.activation-api/1.2.0/javax.activation-api-1.2.0-sources.jar --slot 0 --keywords "~amd64" --ebuild javax-activation-api-1.2.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JavaBeans Activation Framework API jar"
HOMEPAGE="http://java.net/all/javax.activation-api/"
SRC_URI="https://repo.maven.apache.org/maven2/javax/activation/javax.activation-api/${PV}/javax.activation-api-${PV}-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="javax.activation:javax.activation-api:1.2.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"

