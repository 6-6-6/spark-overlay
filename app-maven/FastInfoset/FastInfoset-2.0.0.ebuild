# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/FastInfoset-2.0.0-M2.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/xml/fastinfoset/FastInfoset/2.0.0-M2/FastInfoset-2.0.0-M2-sources.jar --slot 0 --keywords "~amd64" --ebuild FastInfoset-2.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Open Source implementation of the Fast Infoset Standard for Binary XML (http://www.itu.int/ITU-T/asn1/)."
HOMEPAGE="https://projects.eclipse.org/projects/ee4j.jaxb-impl/FastInfoset"
SRC_URI="https://repo.maven.apache.org/maven2/com/sun/xml/fastinfoset/${PN}/${PV}-M2/${P}-M2-sources.jar"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.xml.fastinfoset:FastInfoset:2.0.0-M2"



DEPEND="
	>=virtual/jdk-9:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-9:*
"

S="${WORKDIR}"

