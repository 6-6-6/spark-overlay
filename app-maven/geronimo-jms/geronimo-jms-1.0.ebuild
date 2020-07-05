# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/geronimo-jms_1.1_spec-1.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/geronimo/specs/geronimo-jms_1.1_spec/1.0/geronimo-jms_1.1_spec-1.0.jar --slot 1.1_spec --keywords "~amd64" --ebuild geronimo-jms-1.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/geronimo/specs/${PN}_1.1_spec/${PV}/${PN}_1.1_spec-${PV}.jar -> ${P}.jar"
LICENSE=""
SLOT="1.1_spec"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.geronimo.specs:geronimo-jms_1.1_spec:1.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
