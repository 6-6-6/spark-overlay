# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jboss-interceptors-api_1.2_spec-1.0.1.Final.pom --download-uri https://repo1.maven.org/maven2/org/jboss/spec/javax/interceptor/jboss-interceptors-api_1.2_spec/1.0.1.Final/jboss-interceptors-api_1.2_spec-1.0.1.Final-sources.jar --slot 1.2_spec --keywords "~amd64" --ebuild jboss-interceptors-api-1.0.1-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="The Java(TM) EE  Interceptors 1.2 API classes from JSR 318."
HOMEPAGE="http://www.jboss.org/jboss-interceptors-api_1.2_spec"
SRC_URI="https://repo1.maven.org/maven2/org/jboss/spec/javax/interceptor/${PN}_1.2_spec/${PV}.Final/${PN}_1.2_spec-${PV}.Final-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/jboss/spec/javax/interceptor/${PN}_1.2_spec/${PV}.Final/${PN}_1.2_spec-${PV}.Final.jar -> ${P}-bin.jar"
LICENSE=""
SLOT="1.2_spec"
KEYWORDS="~amd64"
MAVEN_ID="org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.2_spec:1.0.1.Final"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
