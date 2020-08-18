# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/aalto-xml-1.0.0.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/com/fasterxml/aalto-xml/1.0.0/aalto-xml-1.0.0-sources.jar --binjar-uri https://repo1.maven.org/maven2/com/fasterxml/aalto-xml/1.0.0/aalto-xml-1.0.0.jar --slot 0 --keywords "~amd64" --ebuild aalto-xml-1.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-simple-plugins

DESCRIPTION="A demo that use spark-core to perform Monte Carlo simulations"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
LICENSE="Apache-2.0"
SLOT="2.12"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.codehaus.woodstox:stax2-api:4.0.0 -> >=dev-java/stax2-api-4.0.0:0

CDEPEND="
	dev-java/spark-core:2.12
"

DEPEND="
	virtual/jdk:1.8
	${CDEPEND}
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="spark-core-2.12"

src_unpack() {
	cp "${FILESDIR}"/*scala "${S}"
}

src_compile() {
	java-pkg-simple-plugins_src_compile
}

src_install() {
	java-pkg-simple_src_install

	dobin "${FILESDIR}"/${PN}-${SLOT}
}
