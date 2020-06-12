# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jaxb-bundles-3.0.0-M4.pom --download-uri https://repo.maven.apache.org/maven2/com/sun/xml/bind/mvn/jaxb-bundles/3.0.0-M4/jaxb-bundles-3.0.0-M4-sources.jar --slot 0 --keywords "~amd64" --ebuild jaxb-bundles-3.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

DESCRIPTION="JAXB bundles module."
HOMEPAGE="https://eclipse-ee4j.github.io/jaxb-ri/jaxb-bundles"
LICENSE=""
SLOT="3.0"
KEYWORDS="~amd64"
MAVEN_ID="com.sun.xml.bind.mvn:jaxb-bundles:3.0.0-M4"



DEPEND="
	>=virtual/jdk-1.8:*
	dev-java/jaxb-core:${SLOT}
	dev-java/jaxb-runtime:${SLOT}
	dev-java/jaxb-xjc:${SLOT}
	dev-java/jaxb-jxc:${SLOT}
	dev-java/jaxb-ri:${SLOT}
	dev-java/jaxb-osgi:${SLOT}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

