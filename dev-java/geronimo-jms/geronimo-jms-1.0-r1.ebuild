# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/geronimo-jms_1.1_spec-1.0.pom --download-uri https://repo1.maven.org/maven2/org/apache/geronimo/specs/geronimo-jms_1.1_spec/1.0/geronimo-jms_1.1_spec-1.0.jar --slot 1.1_spec --keywords "~amd64" --ebuild geronimo-jms-1.0.ebuild

EAPI=8

MAVEN_ID="org.apache.geronimo.specs:geronimo-jms_1.1_spec:1.0"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="Apache Geronimo Java Message Service"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/org/apache/geronimo/specs/${PN}_1.1_spec/${PV}/${PN}_1.1_spec-${PV}.jar -> ${P}.jar"
LICENSE="Apache-2.0"
SLOT="1.1_spec"
KEYWORDS="~amd64"

DEPEND="
	>=virtual/jdk-1.8:*
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"
